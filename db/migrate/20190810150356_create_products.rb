class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.references :label, null: false, foreign_key: true, index: true
    	t.string :title, null: false
    	t.string :image_id
    	t.integer :price, default: 0
    	t.integer :amount, defauot: 0
    	t.integer :product_status_id, null: false, default: 1
    	t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
