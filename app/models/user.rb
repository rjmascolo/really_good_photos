class User < ApplicationRecord
  has_many :userphoto
  has_many :users, through: :userphoto

  has_secure_password

  geocoded_by :home_location
  before_validation :geocode
  validates :email, uniqueness:true
  validates :password, length: { minimum: 7 }

end
