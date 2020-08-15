class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = Review.all 
    end 

    def new
        @review = Review.new 
    end

    def create
        @review = Review.new(reviews_params)
        if @review.save 
            redirect_to review_path(@review)
        else 
            render :new, alert: "All fields required"
        end
    end
    

    def show
    end

    def edit
    end

    def update
        @review.update(reviews_params)
        if @review.save 
            redirect_to review_path(@review)
        else 
            render :edit, alert: "All fields required"
        end
    end

    def destroy
        @review.destroy 
        redirect_to books_path 
    end 

    private 

    def reviews_params
        params.require(:review).permit(:title, :stars, :content)
    end 


    def set_review 
        @review = Review.find_by(id: params[:id])
    end 
 
end
