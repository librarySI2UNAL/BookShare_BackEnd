require "net/http"
require "json"

class City < ApplicationRecord
	validates :place_id, presence: true, uniqueness: true
	validates :name, presence: true

	def self.load_city_by_position( latitude, longitude )
		latlng = latitude.to_s + "," + longitude.to_s
		uri = URI( "http://maps.googleapis.com/maps/api/geocode/json" )
		parameter = { latlng: latlng }
		uri.query = URI.encode_www_form( parameter )
		response = Net::HTTP.get_response( uri )
		response["Content-Type"] = "application/json"
		if !response.is_a?( Net::HTTPSuccess )
			return nil
		end

		aux = JSON.parse( response.body )["results"][JSON.parse( response.body )["results"].length - 3]
		city_h = {}
		city_h[:name] = aux["address_components"][0]["long_name"]
		city_h[:place_id] = aux["place_id"]
		
		city = self.find_by_place_id( city_h[:place_id] )
		if city == nil
			city = CitiesDAO.create_city( city_h )
		end

		return city
	end
end
