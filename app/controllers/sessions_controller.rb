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
    end 

    def destroy
    end 
end