require "uri"
require "faraday"

module DarkSky; end
class DarkSky::API

  # Get the Dark Sky API credentials via typical Rails appplication credentials.
  #
  # @return [Hash] the credentials
  #
  def self.credentials
    @credentials ||= Rails.application.credentials.env[Rails.env.to_sym][:dark_sky][:api]
  end

  # Get the Dark Sky API secret key via the typical Rails appplication credentials.
  #
  # @return [String] the secret key
  #
  def self.secret_key
    @secret_key ||= credentials[:secret_key]
  end

  # Craft a Dark Sky API URL suitable to get a weather forecast for a given place.
  #
  # @param [Decimal] latitude
  # @param [Decimal] longitude
  # @return [URI] URI of the request
  #
  def self.uri(latitude:, longitude:)
    URI("https://api.darksky.net/forecast/#{secret_key}/#{latitude},#{longitude}")
  end

  # Get a Dark Sky API via Faraday
  #
  # @param [Decimal] latitude
  # @param [Decimal] longitude
  # @return [Faraday::Response] response
  #
  def self.get(latitude:, longitude:)
    Faraday.get uri(latitude: latitude, longitude: longitude)
  end

  def self.icon_keys
    [
        "clear-day",
        "clear-night",
        "rain",
        "snow",
        "sleet",
        "wind",
        "fog",
        "cloudy",
        "partly-cloudy-day",
        "partly-cloudy-night",
    ]
  end
  
end
