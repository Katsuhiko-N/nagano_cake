class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :making_status, null: false, default: '0'
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
