require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "secret"
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def authorized_user?(post)
      post.user == current_user        
    end
    
  end

end
