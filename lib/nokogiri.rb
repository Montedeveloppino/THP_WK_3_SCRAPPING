require 'rubygems'
require 'nokogiri'  
require 'open-uri'

def scrapper
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
end

def crypto(page)
    array_name = []
    array_value = []
    name_of_crypto = page.xpath('//tr//td[3]')
    value_of_crypto = page.xpath('//tr//td[5]')

    name_of_crypto.each do |name|
      array_name << name.text
    end

    value_of_crypto.each do |value|
      array_value << value.text
    end

    array_value_of_crypto = array_value.map { |word| word.gsub('$', '') }
    mon_hash = Hash[array_name.zip array_value_of_crypto]

    mon_hash.each do |name , value|
        final_crypto = {name => value.delete(',').to_f}
        puts [final_crypto]
    end
end

crypto(scrapper)
