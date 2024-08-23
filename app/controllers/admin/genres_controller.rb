class Admin::GenresController < ApplicationController
    def index
        @genres = Genre.all
        @genre = Genre.new
    end
    
    def create
        @genre_save = Genre.new(genre_params)
        @genre_save.save
        @genres = Genre.all
        @genre = Genre.new
        render :index
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    
    private
    
    def genre_params
        params.require(:genre).permit(:name)
    end
    
    
    
end
