class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @genres = Genre.all 
        @search = params[:search] 
        if !params[:genre].blank?
            @books = Book.where(genre: params[:genre]) 
        elsif !params[:search].blank?
            @books = Book.search(@search) 
        else 
            @books = Book.sort_by_title
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
        @reviews = @book.reviews.by_date(15)
    end

    def edit
    end

    def update #add a book to a list or edit a book as an admin 
        if params[:book][:lists] != nil  #to add book to a list 
            @list = List.find_by(id: params[:book][:lists])
            authorize @list
            add_book_to_list(@book, @list)
        else
            authorize @book 
            if  @book.update(book_params) 
                redirect_to book_path(@book), alert: "Book successfully updated"
            else 
                render :edit, alert: "All fields required"
            end
        end
    end

    def destroy
        if params[:list_id] != nil
            book = Book.find_by(id: params[:id])
            list = List.find_by(id: params[:list_id])
            list.books.delete(@book) 
            redirect_to user_list_path(current_user, list), notice: "#{book.title} was removed from this list."
        else 
            authorize @book 
            @book.destroy 
            redirect_to books_path, notice: 'Book was successfully destroyed.'
        end 
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
    
    def add_book_to_list(book, list)
        if already_on_list?(book, list)
            redirect_to user_list_path(current_user, list), notice: "You have already added this book to #{list.title}"
        else 
            list.books << book
            list.save 
            redirect_to user_list_path(current_user, list), notice: "#{book.title} successfully added to your list"
        end
    end

end
