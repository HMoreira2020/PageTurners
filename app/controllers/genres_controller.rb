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
    

    def show
        @genre = Genre.find_by(id: params[:id])
    end


end
