class Public::CustomersController < ApplicationController
    def show
        @customer = Customer.find(current_customer.id)
    end
    
    def edit
        @customer = Customer.find(current_customer.id)
    end
    
    def update
        @customer = Customer.find(current_customer.id)
        @customer.id = current_customer.id
        if @customer.update(customer_params)
            redirect_to c_show_path
        else
            render :edit
        end
    end
    
    def unsubscribe
    end
    
    def withdraw
        customer = Customer.find(is_active: current_customer.id)
        if customer.is_active == true
            customer.is_active = false
            customer.update(customer_params)
            redirect_to c_show_path
        else
            customer.is_active = true
            customer.update(customer_params)
            redirect_to c_show_path
        end
    end
    
    
    
    
    
    private
    
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
      :postal_code, :address, :telephone_number, :is_active)
    end
    
end
