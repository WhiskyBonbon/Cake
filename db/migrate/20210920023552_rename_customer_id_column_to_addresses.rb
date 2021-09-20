class RenameCustomerIdColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :customer_id, :user_id
    rename_column :cart_items, :customer_id, :user_id
    rename_column :orders, :customer_id, :user_id
  end
end
