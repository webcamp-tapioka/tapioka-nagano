class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.references :product, foreign_key: true, null: false, index: true
      t.text :song, null: false
      t.integer :track_number, null: false
      t.integer :disc_number

      t.timestamps
    end
  end
end
