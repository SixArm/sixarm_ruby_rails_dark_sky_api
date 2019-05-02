# -*- coding: utf-8 -*-
require "sixarm_ruby_rails_dark_sky_api"
require "ostruct"

HEX_CHARS = ('0'..'9').to_a + ('a'..'f').to_a
TOKEN_CHARS = ('a'..'z').to_a + ['_']

RAILS_ENV = 9.times.map{TOKEN_CHARS.sample}.join
DARK_SKY_API_SECRET_KEY = 32.times.map{HEX_CHARS.sample}.join

# Mock of Rails.env and Rails.application.credentials
module Rails

  def self.env
    RAILS_ENV
  end

  def self.application
    OpenStruct.new(
      credentials: OpenStruct.new(
        env: {
          RAILS_ENV.to_sym => {
            dark_sky: {
              api: {
                secret_key: DARK_SKY_API_SECRET_KEY
              }
            }
          }
        }
      )
    )
  end
  
end

        
describe DarkSky::API do

  let(:latitude){
    rand(-90.0...90.0)
  }

  let(:longitude){
    rand(-180.0...180.0)
  }

  let(:secret_key){
    DARK_SKY_API_SECRET_KEY
  }

  describe ".credentials" do

    it "get credentials" do
      act = DarkSky::API::credentials
      expect(act).must_be_kind_of Hash
      expect(act).must_include :secret_key
    end

  end

  describe ".secret_key" do

    it "get secret key" do
      act = DarkSky::API::secret_key
      expect(act).must_be_kind_of String
      expect(act).must_match(/^[0-9a-f]{32}/)
    end

  end

  describe ".uri" do

    it "get uri" do
      act = DarkSky::API::uri(latitude: latitude, longitude: longitude)
      expect(act).must_be_kind_of URI
      expect(act.to_s).must_equal "https:\/\/api.darksky.net/forecast/#{secret_key}/#{latitude},#{longitude}"
    end

  end

  describe ".get" do

    it "request" do
      act = DarkSky::API::get(latitude: latitude, longitude: longitude)
      expect(act).must_be_kind_of Faraday::Response
      expect(act.status).must_be_kind_of Integer
    end

  end

  describe ".icon_keys" do

    it "return a list of valid Dark Sky icon keys, such as 'clear-day', 'partly-cloudy-day', etc." do
      act = DarkSky::API::icon_keys
      expect(act).must_respond_to :each
      expect(act).must_include "clear-day"
    end

  end

end
