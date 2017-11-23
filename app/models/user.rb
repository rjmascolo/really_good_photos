class User < ApplicationRecord
  has_many :usersphoto
  has_many :photos, through: :usersphoto

  has_secure_password

  geocoded_by :home_location
  before_validation :geocode
  validates :email, uniqueness:true
  validates :password, length: { minimum: 7 }

  def self.logged_in?(session)
    if !session[:user_id]
      redirect_to root_path
    end
  end

  def get_photos(longitude, latitude, radius)
  consumer_key = ENV["PXAPI"]

  # consumer_secret = "zU5G5qGIow6814cd5PopVrf2vBhiKdi8a7nn8y70"
  base_url = 'https://api.500px.com/v1/photos/search?&geo=' + latitude.to_s + ',' + longitude.to_s + ',' + radius.to_s + '&rpp=100&image_size=1080&nsfw=false&consumer_key=' + consumer_key
  category_data = JSON.parse(RestClient.get(base_url))
  photos_array = []
  category_data['photos'].each do |category|
    c = Category.find_by(category_id: category['category'])
    photos_array << Photo.find_or_create_by(photo_id: category['id'],
      name: category['name'],
      description: category['description'],
      longitude: category['longitude'],
      latitude: category['latitude'],
      taken_at: category['taken_at'],
      category: c,
      location: category['location'],
      rating: category['rating'],
      image_url: category['image_url'])
    end
    photos_array
    # byebug
  end

  def get_photo_info
    photos = get_photos
    final = photos.map do |photo|
      photo_info = Photo.find_or_create_by(photo_id: photo['id'])
      photo_info.name = photo['name']
      photo_info.description = photo['description']
      photo_info.category_id = photo['category'].to_i
      photo_info.taken_at = photo['taken_at']
      photo_info.location = photo['location']
      photo_info.latitude = photo['latitude']
      photo_info.longitude = photo['longitude']
      photo_info.rating = photo['rating']
      photo_info.image_url = photo['image_url']
      photo_info.save
      photo_info

    end
  end

end
