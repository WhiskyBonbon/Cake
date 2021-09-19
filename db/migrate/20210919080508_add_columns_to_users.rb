class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :family_name, :string
    add_column :users, :k_first_name, :string
    add_column :users, :k_family_name, :string
    add_column :users, :address, :string
    add_column :users, :postal_code, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_deleted, :boolean, default: false
  end
end
