class Order < ApplicationRecord
  belongs_to :user
  has_many :items, through: :order_items

  enum address_option: {ご自身の住所:0, 登録済住所から選択:1, 新しいお届け先:3}

end
