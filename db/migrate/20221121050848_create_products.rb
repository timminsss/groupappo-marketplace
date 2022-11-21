class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.string :name
      t.text :description
      t.float :price
      t.string :image_url
      t.string :product_type

      t.timestamps
    end
  end
end
