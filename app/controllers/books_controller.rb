class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @books = Book.all 
    end 

    def new
        @book = Book.new 
    end

    def create
        @book = Book.new(book_params)
        if @book.save 
            redirect_to book_path(@book)
        else 
            render :new, :alert => "All fields required"
        end 
    end


    def show
    end

    def edit
    end

    def update
        @book.update(books_params)
        if @book.save 
            redirect_to book_path(@book)
        else 
            render :edit, alert: "All fields required"
        end
        
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :synopsis, :genre_id)
    end 


    def set_book 
        @book = Book.find_by(id: params[:id])
    end 
 

end
