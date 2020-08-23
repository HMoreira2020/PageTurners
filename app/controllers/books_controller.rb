class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :add_to_list, :update, :destroy]

    def index
        search = params[:search] 
        if params[:search].blank? 
            @books = Book.all
        else 
            @books = Book.search(search)
        end 
    end 


    def new
        @book = Book.new 
    end

    def create
        @book = Book.new(book_params)
        if @book.save 
            redirect_to book_path(@book), notice: "Book successfully created"
        else 
            render :new
        end  
    end


    def show
        @reviews = @book.reviews 
    end

    def edit
    end

    def update
        if params[:book][:lists] != nil 
            @list = List.find_by(id: params[:book][:lists])
            if !already_on_list?(@book, @list)
                add_to_list(@book, @list) 
                redirect_to user_list_path(current_user, @list), notice: "Book successfully added to your list"
            else 
                render :show, alert: "You have already added this book to #{@list.title}"
            end
        elsif @book.update(book_params) 
            redirect_to book_path(@book), alert: "Book successfully updated"
        else 
            render :edit, alert: "All fields required"
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :synopsis, :genre_id, :search, :lists)
    end 

    def set_book 
        @book = Book.find_by(id: params[:id])
    end 
    
    def already_on_list?(book, list)
        list.books.include?(book) ? true : false 
    end 

    def add_to_list(book, list)
        list.books << book
        list.save 
    end 

end
