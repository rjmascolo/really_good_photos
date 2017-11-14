class User < ApplicationRecord
  has_many :userphoto
  has_many :users, through: :userphoto

  has_secure_password

  geocoded_by :home_location
  before_validation :geocode
  validates :email, uniqueness:true
  validates :password, length: { minimum: 7 }


  # ryan = User.new(name:"Ryan Mascolo", email:"rjmascolo@gmail.com", password:"heatherwood", home_location:"bedstuy,ny")
  def get_photos
    base_url = 'https://api.500px.com/v1/photos/search?rpp=100&geo=' + self.longitude.to_s + ',' + self.latitude.to_s + ',5km&image_size=1080&nsfw=false&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e'
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

#   def get_photos
#     # longitude = '40.6872'
#     # latitude = '-73.9418'
#       base_url = 'https://api.500px.com/v1/photos/search?rpp=100&geo=' + self.longitude.to_s + ',' + self.latitude.to_s + ',5km&image_size=1080&nsfw=false&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e'
#       category_data = JSON.parse(RestClient.get(base_url))
#       photos_array = []
#       category_data['photos'].each do |category|
#       photos_array << category
#     end
#     # byebug
#     photos_array
#   end
#
#   def get_photo_info
#     photos = get_photos
#     photo_infos = []
#     photos.each do |photo|
#       photo_info = {}
#       photo_info['photo_id'] = photo['id']
#       photo_info['name'] = photo['name']
#       photo_info['description'] = photo['description']
#       photo_info['category_id'] = photo['category'].to_i
#       photo_info['taken_at'] = photo['taken_at']
#       photo_info['location'] = photo['location']
#       photo_info['latitude'] = photo['latitude']
#       photo_info['longitude'] = photo['longitude']
#       photo_info['rating'] = photo['rating']
#       photo_info['image_url'] = photo['image_url']
#       photo_infos << photo_info
#     end
#     # byebug
#     photo_infos
#   end
#
#
#   def create_photos
#     photo_info = get_photo_info
#     photo_info.each do |photo|
#        new_photo = Photo.new(photo)
#        new_photo.save
#        byebug
#     end
#   end
end
