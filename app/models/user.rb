class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses,dependent: :destroy
  has_many :orders,dependent: :destroy
  has_many :order_items,dependent: :destroy

  validates :first_name,presence: true
  validates :family_name,presence: true
  validates :k_first_name,presence: true
  validates :k_family_name,presence: true
  validates :email,presence: true #uniquness未記入
  validates :encrypted_password,presence: true
  validates :address,presence: true
  validates :postal_code,presence: true
  validates :phone_number,presence: true

  has_many :items, through: :cart_items
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
 #参考URLhttps://qiita.com/yuto_1014/items/358d0a425193b12c969a
 
end