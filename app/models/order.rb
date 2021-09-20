class Order < ApplicationRecord

    has_many :items, through: :order_items

end
