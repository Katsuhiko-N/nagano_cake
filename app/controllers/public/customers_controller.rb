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
            redirect_to customer_path(current_customer.id)
        else
            render :edit
        end
    end
    
    def unsubscribe
    end
    
    def withdraw
        customer = Customer.find(current_customer.id)
        if customer.is_active == true
            customer.id = current_customer.id
            customer.update(is_active: false)
            redirect_to customer_path(current_customer.id)
        else
            customer.id = current_customer.id
            customer.update(is_active: true)
            redirect_to customer_path(current_customer.id)
        end
    end
    
    
    
    
    
    private
    
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
      :postal_code, :address, :telephone_number)
    end
    
    
end
