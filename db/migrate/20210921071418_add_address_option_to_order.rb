class AddAddressOptionToOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :address_option, :integer, default: 0
  end
end
