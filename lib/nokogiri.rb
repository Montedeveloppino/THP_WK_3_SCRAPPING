require 'rubygems'
require 'nokogiri'  
require 'open-uri'

url = "https://coinmarketcap.com/"
unparsed = URI.open(url)
parsed = Nokogiri::HTML(unparsed)

liens = parsed.xpath('//*[@id="__next"]/div/div[2]/div/div/div[2]/table/tbody/tr[1]/td[3]/a/div/div/div/p')
puts liens.text

name_of_crypto = parsed.xpath('//*[@id="__next"]//tr[1]//td[3]/a/div/div/div/p')
puts name_of_crypto.text

valeur = parsed.xpath('//*[@id="__next"]//tr[1]//td[4]/div/a')
puts valeur.text

tab = []


