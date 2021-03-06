class UsersController < ApplicationController
    before_action :require_login,  except: [:new, :create]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]

    def index
        @users = User.all 
    end 

    def new
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            login(@user)
        else 
            render :new, :alert => "All fields required"
        end 
    end


    def show
    end

    def edit
    end

    def update
        @user.update(user_params)
        # @user.image.attach(params[:user][:image])
        if @user.save 
            redirect_to user_path(@user)
        else 
            render :edit, :alert => "All fields required"
        end

    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :image)
    end 


    def set_user 
        @user = User.find_by(id: params[:id])
    end 
 
    def login(user)
        session[:user_id] = user.id
        redirect_to user_path(user.id)
    end  
    
end
