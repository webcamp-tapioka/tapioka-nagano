class CreatePostageAndConsumptiontaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :postage_and_consumptiontaxes do |t|
      t.integer :postage
      t.decimal :consumption_tax, precision: 4, scale: 2

      t.timestamps
    end

    add_column :orders, :consumption_tax, :decimal, 
                precision: 4, scale: 2

  end
end
