class Admin::GenresController < ApplicationController
    def index
        @genres = Genre.all
        @genre = Genre.new
    end
    
    def create
        
    end
    
    def show
        
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    
    private
    
    def index_params
        params.require(:genre).parmit(:name)
    end
    
    
    
end
