class PostsController < ApplicationController

  # GET: /posts
  get "/posts" do
    if logged_in?
      @posts = Post.all
      erb :"/posts/index.html"
    else
      flash[:error] = "Please log in."
      redirect '/login'
    end
  end

  # GET: /posts/new
  get "/posts/new" do
    if logged_in?
      erb :"/posts/new.html"
    else
      flash[:error] = "Please log in."
      redirect '/login'
    end
  end

  # POST: /posts
  post "/posts" do
    post = Post.new(topic: params[:topic], content: params[:content], user_id: current_user.id)
    if post.save
      flash[:message] = "Successfully created post."
      redirect "/posts/#{post.id}"
    else
      flash[:error] = "#{post.errors.full_messages.to_sentence}"
      redirect to "posts/new"
    end
  end

  # GET: /posts/5
  get "/posts/:id" do
    if logged_in?
      @post = Post.find(params[:id])
      erb :"/posts/show.html"
    else
      flash[:error] = "Please log in."
      redirect '/login'
    end
  end

  # GET: /posts/5/edit
  get "/posts/:id/edit" do
    if logged_in?
      @post = Post.find(params[:id])
      erb :"/posts/edit.html"
    else
      flash[:error] = "Please log in."
      redirect '/login'
    end
  end

  # PATCH: /posts/5
  patch '/posts/:id' do
    if logged_in?
      if params[:content] == "" || params[:topic] == ""
        redirect to "/params/#{params[:id]}/edit"
      else
        @post = Post.find_by_id(params[:id])
        if @post && @post.user == current_user
          if @post.update(content: params[:content]) && @post.update(topic: params[:topic])
            redirect to "/posts/#{@post.id}"
          else
            redirect to "/posts/#{@post.id}/edit"
          end
        else
          redirect to '/posts'
        end
      end
    else
      redirect to '/login'
    end
  end

  # DELETE: /posts/5/delete
  delete "/posts/:id" do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      if @post && @post.user == current_user
        @post.delete
      end
      redirect to '/posts'
    else
      redirect "/posts"
    end
  end
end
