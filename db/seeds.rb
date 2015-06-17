# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "open-uri"
require "json"
require "nokogiri"

api_url = "https://api.foursquare.com/v2/venues/explore?near=Paris&query=restaurant&section=topPicks&limit=10&oauth_token=SZFPCKOGJOYDWSLHFF0WWM1IKQ34GM2TAXBK0UIS20AWWS3U&v=20150617"
  open(api_url) do |stream|
    response = JSON.parse(stream.read)
    for i in (0...response["response"]["groups"][0]["items"].size)
      Restaurant.new(name: response["response"]["groups"][0]["items"][i]["venue"]["name"], address: response["response"]["groups"][0]["items"][i]["venue"]["location"]["formattedAddress"].join(", ")).save
    end
  end
