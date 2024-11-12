class Public::OrdersController < ApplicationController
  
  
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    
  end
  
  def confirm
    # カート情報 =>hiddenで送る
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    
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
  end
  
  
  def create
    binding.pry
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
