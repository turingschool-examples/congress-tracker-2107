class SessionsController < ApplicationController
    def new
    end 
    
    def create 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Welcome, #{user.username}!"
            redirect_to root_path if user.default?
            redirect_to admin_dashboard_path if user.admin?
        else 
            flash[:error] = "Sorry, your credentials are bad."
            render :new
        end 
    end 

    def destroy 
        session.clear
        redirect_to root_path
    end 
end 