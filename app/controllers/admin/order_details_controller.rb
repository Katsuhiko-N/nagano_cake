class Admin::OrderDetailsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

  def update
      @order_detail = OrderDetail.find(params[:id])
      order = Order.find(@order_detail.order_id)
      if @order_detail.update(order_detail_params)
        #   製作開始時注文ステータスも変更
          if (@order_detail.making_status == 2) || (order.status != "2")
              order.update(status: "2")
          end
          
        # すべての製作ステータスが3なら発送準備
        if order.all_conplete_check(order.id)
            order.update(status: "3")
        end
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
