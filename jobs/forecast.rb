require 'net/https'
require 'json'
# dotenv doesn't seem to load from config.ru and I'm not sure why
require 'dotenv'
Dotenv.load

# Forecast API Key from https://developer.forecast.io
# Put in .env file and reference here
forecast_api_key = ENV['FORECAST_API_KEY']

# Latitude, Longitude for location - Melbourne AU
forecast_location_lat = "-37.8136"
forecast_location_long = "144.9631"

# Unit Format
# "us" - U.S. Imperial
# "si" - International System of Units
# "uk" - SI w. windSpeed in mph
forecast_units = "si"

SCHEDULER.every '5m', :first_in => 0 do |job|
  http = Net::HTTP.new("api.forecast.io", 443)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  response = http.request(Net::HTTP::Get.new("/forecast/#{forecast_api_key}/#{forecast_location_lat},#{forecast_location_long}?units=#{forecast_units}"))
  forecast = JSON.parse(response.body)
  forecast_current_temp = forecast["currently"]["temperature"].round
  forecast_hour_summary = forecast["hourly"]["summary"]
  send_event('forecast', { temperature: "#{forecast_current_temp}&deg;", hour: "#{forecast_hour_summary}"})
end