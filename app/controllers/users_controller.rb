class UsersController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'users/login.html'
    else
      redirect to '/users'
    end
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome back #{user.name}"
      redirect to "/users"
    else
      flash[:error] = "Please enter a valid email and password."
      redirect '/login'
    end
  end

  get "/users" do
    if logged_in?
      @posts = current_user.posts
      erb :"/users/index.html"
    else
      flash[:error] = "Please log in."
      redirect '/login'
    end
  end

  # GET: /users/new
  get "/users/new" do
    if !logged_in?
      erb :"/users/new.html"
    else
      flash[:message] = "You are already logged in."
      redirect '/users'
    end
  end

  # POST: /users
  post "/users" do
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "/users/#{@user.slug}"
  end

  # GET: /users/5
  get "/users/:slug" do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      @posts = @user.posts
      erb :"/users/show.html"
    else
      flash[:error] = "Please log in."
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end
end
