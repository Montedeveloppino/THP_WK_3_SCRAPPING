require 'nokogiri'
require 'open-uri'
def scrap_mail
  pages = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/groslay.html"))
end

def mail_avernes(pages)
 mail = pages.xpath('//section[2]//tr[4]/td[2]').text
 puts mail
end
 
mail_avernes(scrap_mail)