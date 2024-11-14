class Order < ApplicationRecord
    
    has_many :order_details, dependent: :destroy
    belongs_to :customer
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    def status_now
        if status == 0
            return "入金待ち"
        elsif status == 1
            return "入金確認"
        elsif status == 2
            return "製作中"
        elsif status == 3
            return "発送準備中"
        elsif status == 4
            return "発送済み"
        else
            return "ステータスエラー"
        end
    end
    
end
