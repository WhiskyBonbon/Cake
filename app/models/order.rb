class Order < ApplicationRecord
  belongs_to :user
  has_many :items, through: :order_items
  has_many :order_items

  #enum payment_method: {銀行振込:0, クレジットカード:1}

end
