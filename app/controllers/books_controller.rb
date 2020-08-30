class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @genres = Genre.all 
        @search = params[:search] 
        if !params[:genre].blank?
            @books = Book.where(genre: params[:genre]) 
        elsif !params[:ratings].blank?
            @books = Book.filter_by_rating
        elsif !params[:search].blank?
            @books = Book.search(@search)
        else 
            @books = Book.sort_by_title
        end 
    end 

    def recommended 
        @books = Book.filter_by_rating
    end 
    
    def new
        @book = Book.new 
        authorize @book
    end

    def create
        @book = Book.new(book_params)
        authorize @book
        if @book.save 
            redirect_to book_path(@book), success: "Book successfully created"
        else 
            render :new
        end  
    end


    def show
        @reviews = @book.reviews.by_date(15)
    end

    def edit
        authorize @book
    end

    def update #add a book to a list or edit a book as an admin 
        if params[:book][:lists] != nil  #to add book to a list 
            @list = List.find_by(id: params[:book][:lists])
            authorize @list
            add_book_to_list(@book, @list)
        else
            authorize @book 
            if  @book.update(book_params) 
                redirect_to book_path(@book), success: "Book successfully updated"
            else 
                render :edit, alert: "All fields required"
            end
        end
    end

    def destroy #delete a book off of a list or delete a book as admin
        if params[:list_id] != nil
            @list = List.find_by(id: params[:list_id])
            authorize @list
            @list.books.delete(@book) 
            redirect_to user_list_path(current_user, @list), success: "#{@book.title} was removed from this list."
        else 
            authorize @book 
            @book.destroy 
            redirect_to books_path, success: 'Book was successfully destroyed.'
        end 
        #is it better to do BooksList.where(book_id: book.id, list_id: list.id).destroy all - must take off dependable destroy to do it
    end 


    private

    def book_params
        params.require(:book).permit(:title, :author, :synopsis, :genre_id, :search, :lists)
    end 

    def set_book 
        @book = Book.find_by(id: params[:id])
    end 
    
    #is this the right spot for this helper? 
    def add_book_to_list(book, list)
        if book.already_on_list?(list)
            redirect_to user_list_path(current_user, list), alert: "You have already added this book to #{list.title}"
        else 
            book.add_book(list)
            redirect_to user_list_path(current_user, list), success: "#{book.title} successfully added to your list"
        end
    end
    
end
