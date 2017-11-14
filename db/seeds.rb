# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'


def get_photos
  longitude = '40.6872'
  latitude = '-73.9418'
  base_url = 'https://api.500px.com/v1/photos/search?rpp=100&geo=' + longitude + ',' + latitude + ',5km&image_size=1080&nsfw=false&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e'
  raw_data = RestClient.get(base_url)
  category_data = JSON.parse(raw_data)
  photos_array = []
  category_data['photos'].each do |category|
    photos_array << category
  end
  # byebug
  photos_array
end

def get_photo_info
  photos = get_photos
  photo_infos = []
  photos.each do |photo|
    photo_info = {}
    photo_info['photo_id'] = photo['id']
    photo_info['name'] = photo['name']
    photo_info['description'] = photo['description']
    photo_info['category'] = photo['category']
    photo_info['taken_at'] = photo['taken_at']
    photo_info['location'] = photo['location']
    photo_info['latitude'] = photo['latitude']
    photo_info['longitude'] = photo['longitude']
    photo_info['rating'] = photo['rating']
    photo_info['image_url'] = photo['image_url']
    photo_infos << photo_info
  end
  # byebug
  photo_infos
end


def create_photos
  photo_info = get_photo_info
  photo_info.each do |photo|
     new_photo = Photo.new(photo)
     new_photo.save
     # byebug
  end
end

create_photos
