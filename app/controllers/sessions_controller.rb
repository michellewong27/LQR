class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(username: params[:username])
      
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to home_path
        else 
            flash.alert = ["Incorrect username or password"]
            redirect_to login_path
        end
    end

    def delete
        session[:user_id] = nil
        redirect_to home_path
    end


end