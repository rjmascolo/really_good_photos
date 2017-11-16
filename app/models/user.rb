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

  def get_photos(longitude, latitude)

  base_url = 'https://api.500px.com/v1/photos/search?&geo=' + latitude.to_s + ',' + longitude.to_s + ',5km&image_size=1080&nsfw=false&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e'
  category_data = JSON.parse(RestClient.get(base_url))
  photos_array = []
  category_data['photos'].each do |category|
    photos_array << Photo.find_or_create_by(photo_id: category['id'],
      name: category['name'],
      description: category['description'],
      longitude: category['longitude'],
      latitude: category['latitude'],
      taken_at: category['taken_at'],
      category_id: category['category'].to_i,
      location: category['location'],
      rating: category['rating'],
      image_url: category['image_url'])
    end
    photos_array
  end

end
