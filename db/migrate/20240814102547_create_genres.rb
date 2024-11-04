class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
