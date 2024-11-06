class Public::ItemsController < ApplicationController
  
  def index
    
    @genres = Genre.all
    if params[:genre_name] == nil
      @items = Item.where(is_active: true)
    else
      @items = Genre.find_by(name: params[:genre_name]).items.where(is_active: true)
    end
    
  end

  def show
    @item = Item.find(params[:id])
  end
  
end
