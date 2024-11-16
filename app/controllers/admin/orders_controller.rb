class Admin::OrdersController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    
  def index
    if params[:customer_id].blank?
      @orders = Order.all
    else
      @orders = Order.where(customer_id: params[:customer_id])
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @all_total = 0
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      # 入金確認時自動で制作待ちに
      if @order.status == 1
        order_details = OrderDetail.where(order_id: @order.id)
        order_details.each do |order_detail|
          order_detail.update(making_status: "1")
        end
      end
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
