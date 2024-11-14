class OrderDetail < ApplicationRecord
    
    belongs_to :order
    belongs_to :item
    
    validates :amount, presence: true
    validates :price, presence: true
    validates :item_id, presence: true
    validates :order_id, presence: true
    
    def total_price
        return (amount.to_i * item.price.to_i * 1.1).to_i
    end
    
    
end

