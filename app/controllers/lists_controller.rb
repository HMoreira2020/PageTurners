class ListsController < ApplicationController
    before_action :get_user 
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index
        @lists = @user.lists 
    end 

    def new
        @list = @user.lists.build 
    end

    def create
        @list = @user.lists.build(list_params)
        if @list.save 
            redirect_to user_lists_path(@user), notice: 'List was successfully created.'
        else 
            render :new, alert: "Title required"
        end 
    end
    

    def show
    end

    def edit
    end

    def update
        if @list.update(list_params) 
            redirect_to user_list_path(@user), notice: 'List was successfully updated.'
        else 
            render :edit, alert: "Title required"
        end
    end

    def destroy 
        @list.destroy 
        redirect_to user_lists_path(@user), notice: 'List was successfully destroyed.'
    end 

    private 

    def get_user 
        @user = User.find(params[:user_id])
    end 

    def list_params
        params.require(list).permit(:title, :user_id)
    end 


    def set_list 
        @list = @user.lists.find_by(id: params[:id])
    end 

end
