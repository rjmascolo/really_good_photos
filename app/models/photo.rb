class Photo < ApplicationRecord
  has_many :usersphoto
  has_many :users
  belongs_to :category

  def self.fetch_long_n_lat_for_city_state(city_and_state)
    Geocoder.coordinates(city_and_state)
  end

  def self.search_location_cooridinates(params, user)
    location = Geocoder.search(params[:category][:location])[0].data["geometry"]["location"]
    radius = "#{params[:category][:radius]}#{params[:radius_metric]}"
    user.get_photos(location["lng"], location["lat"], radius)
  end

  def self.return_photos_based_on_category(params, photos)
    category = params[:category][:category_filter]
    photos.select{|photo|photo.category.name == category}
  end


end
