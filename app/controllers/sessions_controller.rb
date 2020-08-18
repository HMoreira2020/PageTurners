class SessionsController < ApplicationController

    def welcome
        
    end 

    def new
        
    end

    def create
        if request.env["omniauth.auth"][:provider] == 'facebook'
            @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
                u.name = auth['info']['name']
                u.username = auth['info']['email']
                u.image = auth['info']['image']
                u.password = SecureRandom.hex
            end
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