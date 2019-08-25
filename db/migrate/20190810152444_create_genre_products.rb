class CreateGenreProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_products do |t|
      t.references :genre, foreign_key: true, null: false, index: true
      t.references :product, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
