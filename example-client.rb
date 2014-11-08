#!/usr/bin/env ruby
# Sample client for HAILO API gem

require 'hailo'
require 'ap'

CFG_USER_KEY  = 'potatoKey'

client = Hailo::Client.new({ app_user_key: CFG_USER_KEY, api_host: 'https://api.hailoapp.com' })
result = client.drivers_near(:latitude => '51.512555', :longitude => '-0.127716')
ap result[0].service_type

result = client.drivers_eta(:latitude => '51.512555', :longitude => '-0.127716')
ap result