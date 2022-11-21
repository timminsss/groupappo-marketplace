class CreateProductAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :product_assignments do |t|
      t.references :product, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
