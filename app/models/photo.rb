class Photo < ApplicationRecord
  has_many :usersphoto
  has_many :users
  belongs_to :category

  def self.fetch_long_n_lat_for_city_state(city_and_state)
    Geocoder.coordinates(city_and_state)
  end

  def create_photos
    photo_info = get_photo_info
    photo_info.each do |photo|
       new_photo = Photo.new(photo)
       # byebug
       new_photo.save
    end
  end
  
end
