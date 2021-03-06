class Item < ApplicationRecord

  has_many :users, through: :cart_items
  has_many :cart_items
  has_many :order_items
  has_many :orders, through: :order_items
  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

end
