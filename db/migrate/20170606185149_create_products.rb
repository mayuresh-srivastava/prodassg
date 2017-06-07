class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 5, scale:2
      t.text :description
      t.string :color
      t.integer :quantity
      t.string :image
      t.decimal :weight

      t.timestamps
    end
  end
end
