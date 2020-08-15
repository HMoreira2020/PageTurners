class SessionsController < ApplicationController

    def welcome
        if logged_in? 
            redirect_to books_path 
        else 
            render :welcome
        end
    end 

    def new
        
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:alert] = "Login is incorrect"
            redirect_to login_path
        end 
    end 

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end 
end