class CartItem < ApplicationRecord
    
    belongs_to :customer
    belongs_to :item
    
    validates :amount, presence: true
    validates :item_id, presence: true
    validates :customer_id, presence: true
    
    
    # 小計
    def subtotal
        (item.with_tax_price.to_i * amount.to_i)
    end
    
end
