class WeatherController < ApplicationController
  require 'net/http'
  require 'json'

  before_action :authorize

  def show
    res = get_weather(request_params[:lat], request_params[:lon])
    render json: {status: 'Success', message: '', data: res, params: request_params}, :status => :ok
  end

  private

  def get_weather(lat, lon)
    open_weather_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=metric"
    cache_key = "#{lat}&#{lon}"

    Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      req = Net::HTTP.get(URI.parse(open_weather_url))
      JSON.parse(req)
    end
  end

  def request_params
    params.permit(:lat, :lon)
  end

end