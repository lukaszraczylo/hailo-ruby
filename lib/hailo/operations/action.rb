require 'open-uri'
require 'hashie'
require 'json'

module Hailo
  module Operations
    class Action
      def initialize(client)
        @client = client
      end

      def drivers_eta( p = {} )
        param = { :api_url => "/drivers/eta" }
        param = param.merge(p)
        @client.session = login_request(param)

      end

      def drivers_near( p = {} )
        param = { :api_url => "/drivers/near" }
        param = param.merge(p)
        @client.session = login_request(param)
      end

      private
      def login_request( p = {} )
        # ap @client.configuration.app_user_key
        if p[:api_url].nil?; p[:api_url] = ''; end
        q_headers = { "Authorization" => @client.configuration.app_user_key }
        q_request = Hash.new
        q_url = "#{@client.configuration.api_host}#{p[:api_url]}"
        p.delete(:api_url)
        p[:api_token] = URI::encode(@client.configuration.app_user_key)
        q_request = p
        @options = { :query => q_request, :headers => q_headers }
        obj = HTTParty.get(q_url.to_s, @options).to_json
        result = JSON.parse(obj)
        obj = Hashie::Mash.new(result)
        return obj
      end
    end
  end
end