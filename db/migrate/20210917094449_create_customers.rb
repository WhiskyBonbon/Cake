class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :family_name, null: false
      t.string :k_first_name, null: false
      t.string :k_family_name, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :phone_number, null: false
      t.boolean :is_deleted, null: false,  default: false

      t.timestamps
    end
  end
end
