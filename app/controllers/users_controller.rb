class UsersController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'users/login.html'
    else
      redirect to '/users/:id'
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

  # GET: /users
  #get "/users" do
   # binding.pry
    
    #erb :"/users/index.html"
  #end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  end

  # GET: /users/5
  get "/users/:id" do
    user = User.find_by(current_user.id)
    @posts = user.posts
    erb :"/users/index.html"
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
