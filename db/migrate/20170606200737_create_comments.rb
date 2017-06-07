class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :author
      t.text :content
      t.integer :rating
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
