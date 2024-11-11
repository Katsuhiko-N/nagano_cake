class Public::OrdersController < ApplicationController
  
  
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
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
end
