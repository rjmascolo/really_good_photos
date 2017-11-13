# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'


def get_photo_ids
  # byebug
  raw_data = RestClient.get('https://api.500px.com/v1/photos?feature=popular&sort=created_at&rpp=30&image_size=3&include_store=store_download&include_states=voted&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e')
  category_data = JSON.parse(raw_data)
  base_url = 'https://api.500px.com/v1/photos/'
  photo_ids = []
  category_data['photos'].each do |category|
    photo_ids << (base_url + category['id'].to_s + '?')
  end
  photo_ids
  byebug
end

get_photo_ids

# https://api.500px.com/v1/photos/search?rpp=100&geo=%2040.704266%2C%20-74.013670%2C10000&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e
