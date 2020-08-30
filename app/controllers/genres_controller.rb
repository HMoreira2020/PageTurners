class GenresController < ApplicationController

    def index
        @genres = Genre.all 
    end 

    def new
        @genre = Genre.new 
        authorize @genre
    end

    def create
        @genre = Genre.new(name: params[:genre][:name])
        authorize @genre
        if @genre.save 
            redirect_to genre_path(@genre)
        else 
            render :new, alert: "Genre Name Required"
        end
    end
    
    def edit
        @genre = Genre.find_by(id: params[:id])
        authorize @genre 
    end

    def update
        @genre = Genre.find_by(id: params[:id])
        authorize @genre
        if @genre.update(name: params[:genre][:name]) 
            redirect_to genre_path(@genre), success: 'Genre was successfully updated.'
        else 
            render :edit, alert: "Name required"
        end
    end


    def show
        @genre = Genre.find_by(id: params[:id])
    end


end
