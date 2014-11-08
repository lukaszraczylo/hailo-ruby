# Gem for HAILO API  ( hailocab.com )

[![Gem Version](https://badge.fury.io/rb/hailo.svg)](http://badge.fury.io/rb/hailo) 
[![Code Climate](https://codeclimate.com/github/lukaszraczylo/hailo-ruby/badges/gpa.svg)](https://codeclimate.com/github/lukaszraczylo/hailo-ruby)
[![Gratipay](https://img.shields.io/gratipay/lukaszraczylo.svg)](https://gratipay.com/lukaszraczylo/)

This is a Ruby Gem for the hailocab.com API. It should simplify the process of consuming data from the HAILO API for developers using Ruby.

### Installation
Add following to your application Gemfile

```
gem 'hailo'
```

Then execute

```
$ bundle install
```

Or install it just like that

```
$ gem install hailo
```

### Usage

It's pretty straightforward. Sample script using Hailo API:

```
#!/usr/bin/env ruby
require 'hailo'
require 'ap'

CFG_USER_KEY  = 'potatoKey'

client = Hailo::Client.new({ app_user_key: CFG_USER_KEY, api_host: 'https://api.hailoapp.com' })
result = client.drivers_near(:latitude => '51.512555', :longitude => '-0.127716')
ap result[0].service_type

result = client.drivers_eta(:latitude => '51.512555', :longitude => '-0.127716')
ap result
```

Gives following output. JSON from return has been converted into object to make it easier to query.

```
{
    "drivers" => [
        [0] {
                "latitude" => 51.51025,
               "longitude" => -0.1269102,
            "service_type" => "regular"
        },
        [1] {
                "latitude" => 51.512363,
               "longitude" => -0.13302514,
            "service_type" => "regular"
        },
        [2] {
                "latitude" => 51.510216,
               "longitude" => -0.117230095,
            "service_type" => "regular"
        },
        [3] {
                "latitude" => 51.516865,
               "longitude" => -0.1368112,
            "service_type" => "regular"
        }
    ]
}
{
    "etas" => [
        [0] {
                     "eta" => 5,
                   "count" => 4,
            "service_type" => "regular"
        }
    ]
}
```


