class Public::OrdersController < ApplicationController
  
  
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    
  end
  
  def confirm
    if payment_method == "0"
      # 自身の住所
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_corde
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif payment_method == "1"
      # 登録済み住所（セレクトボックス）
      @order = Order.new(order_params)
      # セレクトボックスの値で検索
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif payment_method == "2"
      # 新しい住所（フォームに入力）
      @order = Order.new(order_params)
    else
      redirect_to cart_items_path
      flash[:notice] = "注文情報エラー"
    end
  end
  
  
  def create
    
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
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
  
  
end
