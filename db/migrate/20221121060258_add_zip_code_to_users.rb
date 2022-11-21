class AddZipCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :zip_code
    add_column :users, :zip_code, :string
  end
end
