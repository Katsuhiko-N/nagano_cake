class Public::CartItemsController < ApplicationController
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to item_path(cart_item_parmas[:item_id])
      flash[:notice] = "カートに保存しました"
    else
      redirect_to item_path(cart_item_parmas[:item_id])
      flash[:notice] = "保存に失敗しました"
    end
  end

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def update
     @cart_item = CartItem.find(params[:id])
     if @cart_item.update(cart_item_params)
       redirect_to cart_items_path
     else
       @cart_items = CartItem.where(customer_id: current_customer.id)
       render :index
     end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
