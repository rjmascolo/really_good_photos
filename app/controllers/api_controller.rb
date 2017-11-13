require 'rest-client'
require 'json'
# require 'pry'

# require_relative '../app/models/drink.rb'
# require_relative '../app/models/ingredient.rb'
# require_relative '../app/models/recipe.rb'

def get_photo_ids

  raw_data = RestClient.get('https://api.500px.com/v1/photos/search?image_size=1080&nsfw=false&consumer_key=DB2deplzrgnIlMH2cbuon1UHMehzARqbW19R4I0e')
  category_data = JSON.parse(raw_data)
  photo_ids = []
  category_data['photos'].each do |category|
    photo_ids << (base_url + category['id']+'?')
  end
  byebug
  photo_ids
end

get_photo_ids
