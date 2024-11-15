class Admin::OrdersController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @all_total = 0
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(params[:id])
      flash[:notice] = "ステータスを更新しました"
    else
      redirect_to admin_order_path(params[:id])
      flash[:notice] = "ステータスの更新に失敗しました"
    end
      
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
  
end
