class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @user = User.all 
    end 

    def new
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            render :new, :alert => "All fields required"
        end 
    end


    def show
    end

    def edit
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end 


    def set_user 
        @user = User.find_by(id: params[:id])
    end 
 

    
end
