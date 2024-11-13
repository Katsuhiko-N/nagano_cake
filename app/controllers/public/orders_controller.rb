class Public::OrdersController < ApplicationController
  
  
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    
  end
  
  def confirm
    # カート情報 =>hiddenで送る
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    @shipping_cost = 800
    
    unless @cart_items.blank?
      @order = Order.new(order_params)
      if params[:order][:select_address] == "0"
        # 自身の住所
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
      elsif params[:order][:select_address] == "1"
        # 登録済み住所（セレクトボックス）
        # セレクトボックスの値で検索
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:order][:select_address] == "2"
        # 新しい住所（フォームに入力）
      else
        redirect_to cart_items_path
        flash[:notice] = "注文情報エラー"
      end
    else
      redirect_to cart_items_path
      flash[:notice] = "カートが空です！"
    end
  end
  
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      # カートアイテムから移植
      cart_items = CartItem.where(customer_id: current_customer.id)
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.item_id = cart_item.item_id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.amount.to_i * cart_item.item.price.to_i * 1.1
        if order_detail.save
          current_customer.cart_items.destroy_all
          redirect_to thanks_orders_path
        else
          redirect_to confirm_orders_path
          flash[:notice] ="注文詳細情報の作成に失敗しました"
        end
      end
    else
      redirect_to confirm_orders_path
      flash[:notice] ="注文の作成に失敗しました"
    end
  end
  
  def thanks
    
  end
  
  

  def index
  end

  def show
  end

  def update
  end

  def destroy
  end
  
  
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end
  
  
end
