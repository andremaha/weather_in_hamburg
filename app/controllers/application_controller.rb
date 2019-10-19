require 'open_weather'



class ApplicationController < ActionController::Base

	def hello
		render json: { message: "Здесь можно написать всё, что угодно!" }
	end

	def goodbye
		render html: "Goodbye, my love!"
	end

	def weather
		options = { units: "metric", APPID: Rails.configuration.open_weather_config }
		hamburg_weather = OpenWeather::Current.geocode(53.551086, 9.993682, options)
		render html: "The weather in #{hamburg_weather["name"]} is #{hamburg_weather["main"]["temp"]} degrees with #{hamburg_weather["weather"][0]["description"]}."
	end
end
