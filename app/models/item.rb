class Item < ApplicationRecord
    has_one_attached :image
    
    belongs_to :genre
    has_many :order_details, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    validates :is_active, presence: true
    validates :image, presence: true
    
    
    
end
