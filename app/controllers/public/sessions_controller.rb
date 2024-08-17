# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  layout 'admin'
  before_action :customer_state, only: [:create]
  
  
  def after_sign_in_path_for(resouce)
     c_show_path
  end
  
  def after_sign_out_path_for(resouce)
     root_path
  end
  
  
  
  
  private
  
  def customer_state
    # 処理１　emailを取得
    customer = Customer.find_by(email:params[:customer][:email])
    # 処理２　アカウントが存在するか否か(nilでreturn)
    return if customer.nil?
    # 処理３　パスワードが一致するか
    return unless customer.valid_password?(params[:customer][:passeord])
    # 処理４　アクティブでない会員をサインアップ画面へ
    return if Customer.is_active == true
    redirect_to new_customer_registration_path
  end
    
    
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
