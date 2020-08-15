class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index
        @lists = List.all 
    end 

    def new
        @list = List.new 
    end

    def create
        @list = List.new(list_params)
        if @list.save 
            redirect_to user_path(current_user)
        else 
            render :new, alert: "Title required"
        end 
    end
    

    def show
    end

    def edit
    end

    def update
        @list.update(list_params)
        if @list.save 
            redirect_to list_path(@list)
        else 
            render :edit, alert: "Title required"
        end
    end

    def destroy 
        @list.destroy 
        redirect_to user_path(current_user)
    end 

    private 

    def list_params
        params.require(list).permit(:title)
    end 


    def set_list 
        @list = List.find_by(id: params[:id])
    end 

end
