class UsersController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'users/login.html'
    else
      redirect to '/users/:slug'
    end
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/users/#{user.id}"
    else
      redirect '/login'
    end
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "/users/#{@user.slug}"
  end

  # GET: /users/5
  get "/users/:slug" do
    binding.pry
    user = User.find_by_slug(params[:slug])
    @posts = user.posts
    erb :"/users/index.html"
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
