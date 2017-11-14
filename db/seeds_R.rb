# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# require 'rest-client'
# require 'json'
#
#
# def get_photos
#   longitude = '40.6872'
#   latitude = '-73.9418'
#   base_url = 'https://api.500px.com/v1/photos/search?rpp=100&geo=' + longitude + ',' + latitude + ',5km&image_size=1080&nsfw=false&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e'
#   raw_data = RestClient.get(base_url)
#   category_data = JSON.parse(raw_data)
#   photos_array = []
#   category_data['photos'].each do |category|
#     photos_array << category
#   end
#   # byebug
#   photos_array
# end
#
# def get_photo_info
#   photos = get_photos
#   photo_infos = []
#   photos.each do |photo|
#     photo_info = {}
#     photo_info['photo_id'] = photo['id']
#     photo_info['name'] = photo['name']
#     photo_info['description'] = photo['description']
#     photo_info['category_id'] = photo['category'].to_i
#     photo_info['taken_at'] = photo['taken_at']
#     photo_info['location'] = photo['location']
#     photo_info['latitude'] = photo['latitude']
#     photo_info['longitude'] = photo['longitude']
#     photo_info['rating'] = photo['rating']
#     photo_info['image_url'] = photo['image_url']
#     photo_infos << photo_info
#   end
#   # byebug
#   photo_infos
# end
#
#
# def create_photos
#   photo_info = get_photo_info
#   photo_info.each do |photo|
#      new_photo = Photo.new(photo)
#      new_photo.save
#      # byebug
#   end
# end
#
# x = create_photos

def get_photos_seed
  longitude = '40.6872'
  latitude = '-73.9418'
  base_url = 'https://api.500px.com/v1/photos/search?rpp=100&geo=' + longitude + ',' + latitude + ',5km&image_size=1080&nsfw=false&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e'
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

# Category seeding
Category.create(category_id: '0', name: 'Uncategorized')
Category.create(category_id: '1', name: 'Celebrities')
Category.create(category_id: '2', name: 'Film')
Category.create(category_id: '3', name: 'Journalism')
Category.create(category_id: '4', name: 'Nude')
Category.create(category_id: '5', name: 'Black and White')
Category.create(category_id: '6', name: 'Still Life')
Category.create(category_id: '7', name: 'People')
Category.create(category_id: '8', name: 'Landscape')
Category.create(category_id: '9', name: 'City and Architecture')
Category.create(category_id:'10', name: 'Abstract')
Category.create(category_id:'11', name: 'Animals')
Category.create(category_id:'12', name: 'Macro')
Category.create(category_id:'13', name: 'Travel')
Category.create(category_id:'14', name: 'Fashion')
Category.create(category_id:'15', name: 'Commercial')
Category.create(category_id:'16', name: 'Concert')
Category.create(category_id:'17', name: 'Sport')
Category.create(category_id:'18', name: 'Nature')
Category.create(category_id:'19', name: 'Performing Arts')
Category.create(category_id:'20', name: 'Family')
Category.create(category_id:'21', name: 'Street')
Category.create(category_id:'22', name: 'Underwater')
Category.create(category_id:'23', name: 'Food')
Category.create(category_id:'24', name: 'Fine Art')
Category.create(category_id:'25', name: 'Wedding')
Category.create(category_id:'26', name: 'Trasportation')
Category.create(category_id:'27', name: 'Urban Exploration')
Category.create(category_id:'29', name: 'Arial')
Category.create(category_id:'30', name: 'Night')

data = get_photos_seed
