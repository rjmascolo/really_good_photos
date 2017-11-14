class Photo < ApplicationRecord
  has_many :userphoto
  has_many :users, through: :userphoto
  belongs_to :category

  def self.fetch_long_n_lat_for_city_state(city_and_state)
    Geocoder.coordinates(city_and_state)
  end

end
