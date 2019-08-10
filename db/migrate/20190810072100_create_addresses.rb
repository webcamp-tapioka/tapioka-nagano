class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user,null: false,foreign_key: true
      t.string :delivery_postal_code,null: false
      t.text :delivery_address,null: false
      t.string :delivery_name,null: false

      t.timestamps
    end
  end
end
