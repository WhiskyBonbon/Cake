class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many:addresses, dependent: :destroy
　has_many :orders, dependent: :destroy
　has_many :order_items, dependent: :destroy
　
　validates :first_name,presence: true
　validates :family_name,presence: true
　validates :k_first_name,presence: true
　validates :k_family_name,presence: true
　validates :email,presence: true
　#↑uniquness未記入
　validates :encrypted_password,presence: true
　validates :address,presence: true
　validates :postal_code,presence: true
　validates :phone_number,presence: true

end