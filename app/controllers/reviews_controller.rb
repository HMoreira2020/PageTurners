class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :get_book, only: [:new, :create, :update, :destroy]

    def index
    end 

    def new
        if current_user.can_review?(@book)
            @review = Review.new
        else 
            redirect_to book_path(@book), alert: "You have already written a review for #{@book.title}"
        end 
    end

    def create
        if current_user.can_review?(@book)
        @review = Review.new(reviews_params)
            if @review.save 
                redirect_to book_path(@book), notice: "You have reviewed #{@book.title}"
            else 
                render :new, alert: "All fields required"
            end
        else 
            redirect_to book_path(@book), alert: "You have already written a review for this #{@book.title}"
        end 
    end
    

    def show
    end

    def edit
        authorize @review
    end

    def update
        authorize @review 
        if @review.update(reviews_params)
            redirect_to review_path(@review), notice: "Your review was successfully updated."
        else 
            render :edit, alert: "All fields required"
        end
    end

    def destroy
        authorize @review 
        @review.destroy 
        redirect_to book_path(@review.book), notice: "Your review was successfully deleted" 
    end 

    private 

    def reviews_params
        params.require(:review).permit(:stars, :content, :book_id, :user_id)
    end 


    def set_review 
        @review = Review.find_by(id: params[:id])
    end 

    def get_book 
        @book = Book.find_by(id: params[:book_id])
    end 
 
end
