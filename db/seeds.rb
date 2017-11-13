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
  photos = []
  category_data['photos'].each do |category|
    photos << category
  end
  # byebug
  photos
end

get_photos

# https://api.500px.com/v1/photos/search?rpp=100&geo=%2040.704266%2C%20-74.013670%2C10000&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e
# https://api.500px.com/v1/photos/{id}?image_size=4&comments=1&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e
