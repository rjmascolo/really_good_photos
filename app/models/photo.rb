class Photo < ApplicationRecord

  def fetch_long_n_lat_for_city_state(city_and_state)
    Geocoder.coordinates(city_and_state)
  end

end
