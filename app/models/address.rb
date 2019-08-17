class Address < ApplicationRecord
	belongs_to :user

# default値は未設定。
  enum delivery_address_flag: %i( メイン住所 その他住所 )

end
