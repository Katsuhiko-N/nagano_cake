class Public::ItemsController < ApplicationController
  
  def index
    
    @genres = Genre.all
    if params[:genre_name] == nil
      @items = Item.all
    else
      @items = Genre.find_by(name: params[:genre_name]).items
    end
    
  end

  def show
    @item = Item.find(params[:id])
  end
  
end
