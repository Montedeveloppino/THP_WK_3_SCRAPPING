require 'rubygems'
require 'nokogiri'  
require 'open-uri'

url = "https://coinmarketcap.com/"
  unparsed = URI.open(url)
  parsed = Nokogiri::HTML(unparsed)

  liens = parsed.xpath('//*[@id="__next"]/div/div[2]/div/div/div[2]/table/tbody/tr[1]/td[3]/a/div/div/div/p')
  liens2 = parsed.xpath('//*[@id="__next"]/div/div[2]/div/div/div[2]/table/tbody/tr[2]/td[3]/a/div/div/div/p')
  liens3 = parsed.xpath('//*[@id="__next"]/div/div[2]/div/div/div[2]/table/tbody/tr[3]/td[3]/a/div/div/div/p')
  puts liens.text
  puts liens2.text
  puts liens3.text

