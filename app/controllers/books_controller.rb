class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

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
            if already_on_list?(@book, @list)
                redirect_to user_list_path(current_user, @list), notice: "You have already added this book to #{@list.title}"
            else 
                add_to_list(@book, @list) 
                redirect_to user_list_path(current_user, @list), notice: "#{@book.title} successfully added to your list"
            end
        elsif @book.update(book_params) 
            redirect_to book_path(@book), alert: "Book successfully updated"
        else 
            render :edit, alert: "All fields required"
        end
    end

    def destroy
        book = Book.find_by(id: params[:id])
        list = List.find_by(id: params[:list_id])
        list.books.delete(@book) 
        redirect_to user_list_path(current_user, list), notice: "#{book.title} was removed from this list."
        #why can't I do BooksList.where(book_id: book.id, list_id: list.id).destroy all - gave me no such colum books_lists error
    end 


    private

    def book_params
        params.require(:book).permit(:title, :author, :synopsis, :genre_id, :search, :lists)
    end 

    def set_book 
        @book = Book.find_by(id: params[:id])
    end 
    
    #do these go in the book.rb? 
    def already_on_list?(book, list)
        list.books.include?(book) 
    end 

    def add_to_list(book, list)
        list.books << book
        list.save 
    end 

end
