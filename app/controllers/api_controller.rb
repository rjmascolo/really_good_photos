require 'rest-client'
require 'json'
require 'pry'

# require_relative '../app/models/drink.rb'
# require_relative '../app/models/ingredient.rb'
# require_relative '../app/models/recipe.rb'

def get_photo_ids
  raw_data = RestClient.get('https://api.500px.com/v1/photos?feature=popular')
  category_data = JSON.parse(raw_data)
  base_url = 'https://api.500px.com/v1/photos/'
  byebug
  photo_ids = []
  category_data['photos'].each do |category|
    photo_ids << (base_url + category['id']+'?')
  end
  photo_ids
end
