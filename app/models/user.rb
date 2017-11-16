class User < ApplicationRecord
  has_many :usersphoto
  has_many :photos, through: :usersphoto

  has_secure_password

  geocoded_by :home_location
  before_validation :geocode
  validates :email, uniqueness:true
  validates :password, length: { minimum: 7 }

  def logged_in?
    if !session[:user_id]
      redirect_to root_path
    end
  end

  def get_photos

    base_url = 'https://api.500px.com/v1/photos/search?geo=' + self.latitude.to_s + ',' + self.longitude.to_s + ',5km&rpp100&image_size=1080&nsfw=false&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e'
    raw_data = RestClient.get(base_url)
    category_data = JSON.parse(raw_data)
    photos_array = []
    category_data['photos'].each do |category|
      photos_array << category
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
