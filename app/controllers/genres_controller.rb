class GenresController < ApplicationController
    def index
        @genres = Genre.all 
    end 

    def new
        @genre = Genre.new 
    end

    def create
        @genre = Genre.new(name: params[:genre][:name])
        if @genre.save 
            redirect_to genre_path(@genre)
        else 
            render :new, alert: "Genre Name Required"
        end
    end
    
    def edit
        @genre = Genre.find_by(id: params[:id])
    end

    def update
        @genre = Genre.find_by(id: params[:id])
        if @genre.update(name: params[:genre][:name]) 
            redirect_to genre_path(@genre), notice: 'Genre was successfully updated.'
        else 
            render :edit, alert: "Name required"
        end
    end


    def show
        @genre = Genre.find_by(id: params[:id])
    end


end
