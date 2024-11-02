class Public::GenresController < ApplicationController
    
    
    def index
        # 新規登録用
        @genre = Genre.new
        # 一覧表示用
        @genres = Genre.all
    end
    
    def create
        @genre = Genre.new(genre_params)
        
        if @genre.save
            redirect_to genres_path
        else
            @genres = Genre.all
            render :index
        end
        
    end
    
    def edit
        @genre = Genre.find(params[:id])
    end
    
    def update
        @genre = Genre.find(params[:id])
        if @genre.update(genre_params)
            redirect_to genres_path
        else
            render :edit
        end
    end
    
    
    private
    
    def genre_params
        params.require(:genre).permit(:name)
    end
       
end