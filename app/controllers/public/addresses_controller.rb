class Public::AddressesController < ApplicationController
# 他者が編集できないよう後で権限必要


  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_path)
    if @address.save
      redirect_to addresses_path
    else
      render :new
      @addresses = Address.new
    end
  end

  def edit
    @addresses = Address.find(params[:id])
  end

  def update
    @addresses = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @addresses = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  
  private
  
  def address_params
      params.require(:address).permit(:name, :postal_code, :address)
  end
  
  
  
  
end
