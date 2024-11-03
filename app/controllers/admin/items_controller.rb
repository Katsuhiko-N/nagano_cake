class Admin::ItemsController < ApplicationController
    layout 'admin'
    # before_action :authenticate_admin!
    
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        
        if @item.save
            redirect_to new_admin_item_path
        else
            render :new
        end
    end
    
    
    def index
        
    end
    
    
    private
    
    def item_params
        paramsrequire(:item).permit(:image, :name, :introduction, :price, :is_active)
    end
    
    
end
