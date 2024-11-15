class OrderDetail < ApplicationRecord
    
    belongs_to :order
    belongs_to :item
    
    validates :amount, presence: true
    validates :price, presence: true
    validates :item_id, presence: true
    validates :order_id, presence: true
    
    def total_price
        return (amount.to_i * item.price.to_i)
    end
    
    
    def status_now
        if making_status == 0
            return "着手不可"
        elsif making_status == 1
            return "制作待ち"
        elsif making_status == 2
            return "製作中"
        elsif making_status == 3
            return "製作完了"
        else
            return "ステータスエラー"
        end
    end
    
    
end

