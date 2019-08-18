class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :single_album_flag, :integer, default: 0
  end
end
