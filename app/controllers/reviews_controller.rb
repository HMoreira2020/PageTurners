class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]

    def index
    end 

    def new
    end

    def create
    end
    

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end 

    private 

    def reviews_params
        params.require(:review).permit(:title, :stars, :content)
    end 


    def set_review 
        @review = Review.find_by(id: params[:id])
    end 
 
end
