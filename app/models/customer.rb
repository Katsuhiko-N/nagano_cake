class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :addresses, dependent: :destroy
  has_many :oderes, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + last_name + first_name
  end

end
