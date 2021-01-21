require 'rubygems'
require 'nokogiri'  
require 'open-uri'

url = "https://coinmarketcap.com/"
  unparsed = URI.open(url)
  parsed = Nokogiri::HTML(unparsed)
liens = parsed.xpath('//a')

puts liens.text