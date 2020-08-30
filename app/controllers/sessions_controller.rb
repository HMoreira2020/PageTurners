class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :welcome]

    def welcome
        
    end 

    def new
        
    end

    def create
        if auth != nil && auth[:provider] == 'facebook'
            @user = User.create_by_facebook_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                flash[:alert] = "Login is incorrect"
                redirect_to login_path
            end 
        end 
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end 

    private 


    
    def auth
        request.env['omniauth.auth']
    end
end