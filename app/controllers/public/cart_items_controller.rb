class Public::CartItemsController < ApplicationController
  
  def create
    # 既にカートにアイテムがあるか
    if CartItem.find_by(customer_id: current_customer.id, item_id: cart_params[:item_id].to_i).nil?
      # ない場合
      @cart_item = CartItem.new(cart_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
        redirect_to item_path(cart_params[:item_id])
        flash[:notice] = "カートに保存しました"
      else
        redirect_to item_path(cart_params[:item_id])
        flash[:notice] = "保存に失敗しました"
      end
    else
      # ある場合
      exist_cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: cart_params[:item_id])
      # amountを加算
      total_amount = exist_cart_item.amount + cart_params[:amount].to_i
      if exist_cart_item.update(amount: total_amount)
        redirect_to item_path(cart_params[:item_id])
        flash[:notice] = "カートに追加しました"
      else
        redirect_to item_path(cart_params[:item_id])
        flash[:notice] = "追加に失敗しました"
      end
      
    end
  end

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
  end

  def update
     @cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: cart_item_params[:item_id])
     if @cart_item.update(amount: cart_item_params[:amount])
       redirect_to cart_items_path
       flash[:notice] = "個数を変更しました"
     else
       @cart_items = CartItem.where(customer_id: current_customer.id)
       render :index
       flash[:notice] = "個数を変更できませんでした"
     end
  end

  def destroy
    unless params[:all_clean].nil?
      current_customer.cart_items.destroy_all
      redirect_to cart_items_path
      flash[:notice] = "カートを空にしました"
    else
      cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: params[:id])
      cart_item.destroy
      redirect_to cart_items_path
      flash[:notice] = "商品をカートから削除しました"
    end
    
  end
  
  
  private
  
  # カートに入れるとき用
  def cart_params
    params.permit(:item_id, :amount)
  end
  
  # カート内員数変更時
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
