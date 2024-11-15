class Admin::OrderDetailsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

  def update
      @order_detail = OrderDetail.find(params[:id])
      if @order_detail.update(order_detail_params)
        redirect_to admin_order_path(params[:order_id])
        flash[:notice] = "ステータスを更新しました"
      else
        redirect_to admin_order_path(params[:order_id])
        flash[:notice] = "ステータスの更新に失敗しました"
      end
  end
  
  
  private
  
  def order_detail_params
      params.require(:order_detail).permit(:making_status)
  end
  
  
  
end
