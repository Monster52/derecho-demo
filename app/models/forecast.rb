class Forecast < Struct.new(:city, :state)
	include ActiveModel::Model

	def get_weather
		Derecho.new(ENV["wunderground_key"], city, state).get_basic_weather_data
	end

	def get_weather_icon
		Derecho.new(ENV["wunderground_key"], city, state).get_icon
	end

	def self.from_hash(hash)
  	obj = self.new
  	hash.each {|key,value| obj.send("#{key}:", value)}
  	obj
	end
end