require 'hailo/version'
require 'hailo/client'

module Hailo
  def self.client
    @client ||= Hailo::Client.new
  end
end
