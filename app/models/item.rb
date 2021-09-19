class Item < ApplicationRecord


  has_many :cart_item
  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

end
