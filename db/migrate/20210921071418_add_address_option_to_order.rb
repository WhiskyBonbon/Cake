class AddAddressOptionToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address_option, :integer, default: 0
  end
end
