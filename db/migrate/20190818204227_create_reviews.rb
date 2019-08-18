class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.references :user,null: false,foreign_key: true,index: true
    	t.references :product,null: false,foreign_key: true,index: true
    	t.text :review,null: false

      t.timestamps
    end
  end
end
