class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.strng :postal_code, null:false
      t.strng :address, null:false
      t.strng :name, null:false

      t.timestamps
    end
  end
end
