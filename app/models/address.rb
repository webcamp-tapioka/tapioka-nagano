class Address < ApplicationRecord
<<<<<<< HEAD
=======
	  validates :delivery_postal_code,presence: true,length: {is: 7}
	  validates :delivery_address,presence: true
	  validates :delivery_name,presence: true
	  validates :delivery_name_kana,presence: true
>>>>>>> origin/master

	belongs_to :user

# default値は未設定。
  enum delivery_address_flag: %i( メイン住所 その他住所 )


<<<<<<< HEAD
end



=======




end
>>>>>>> origin/master
