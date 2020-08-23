class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :get_book, only: [:create, :update, :destroy]

    def new
        @review = Review.new 
    end

    def create
        @review = Review.new(reviews_params)
        if @review.save 
            redirect_to book_reviews_path(@book)
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
        redirect_to book_reviews_path(@review.book), notice: "Your review was successfully deleted" 
    end 

    private 

    def reviews_params
        params.require(:review).permit(:title, :stars, :content, :book_id, :user_id)
    end 


    def set_review 
        @review = Review.find_by(id: params[:id])
    end 

    def get_book 
        @book = Book.find_by(id: params[:book_id])
    end 
 
end
