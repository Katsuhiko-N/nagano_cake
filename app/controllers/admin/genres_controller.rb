class Admin::GenresController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    
    def index
        @genres = Genre.all
        @genre = Genre.new
    end
    
    def create
        @genre_save = Genre.new(genre_params)
        @genre_save.save
        # 以下renderで再表示用インスタンス変数
        @genres = Genre.all
        @genre = Genre.new
        render :index
    end
    
    def edit
        @genre = Genre.find(params[:id])
    end
    
    def update
        @genre = Genre.find(params[:id])
        @genre.id = params[:id]
        if @genre.update(genre_params)
            redirect_to admin_genres_path
        else
            render :edit
        end
    end
    
    
    private
    
    def genre_params
        params.require(:genre).permit(:name)
    end
    
    
    
end
