class Item < ApplicationRecord

  attachment :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

end
