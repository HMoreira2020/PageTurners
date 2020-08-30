class ListsController < ApplicationController
    before_action :get_user, only: [:index, :new, :create, :show]
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index #conditional for whether user navigates to /users/:user_id/lists or /lists
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @lists = @user.lists
        else 
            @lists = List.all 
        end 
    end 

    
    def new
        @list = List.new
    end

    def create 
        @list = current_user.lists.build(list_params)
        if @list.save 
            redirect_to user_path(current_user), success: 'List was successfully created.'
        else 
            render :new, alert: "Title required"
        end 
    end
    

    def show 
        @books = @list.books
    end 

    def edit
        
    end

    def update
        authorize @list
        if @list.update(list_params) 
            redirect_to user_list_path(@list.user_id, @list), success: 'List was successfully updated.'
        else 
            render :edit, alert: "Title required"
        end
    end

    def destroy 
        authorize @list
        @list.destroy 
        redirect_to user_path(current_user), success: 'List was successfully destroyed.'
    end 

    private 

    def get_user 
        @user = User.find_by(id: params[:user_id])
    end 

    def list_params
        params.require(:list).permit(:title, :user_id)
    end 

    def set_list 
        @list = List.find_by(id: params[:id])
    end 

end
