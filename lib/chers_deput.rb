require 'nokogiri'
require 'open-uri'
def scrap_mail
  pages = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
end


def deputes_names(pages)
  array_of_first_name =[]
  array_name = []
  links = pages.xpath('//*[@id="deputes-list"]//a')
  links.each{|link|
    array_name<<link.text
}
for i in 0..array_name.length-1
  if array_name[i][0..2]=="Mme"
      array_name[i][0..3]=array_name[i][0..3].delete("Mme ")
  elsif array_name[i][0..2]=="M. "
      array_name[i][0..2]=array_name[i][0..2].delete("M. ")
  elsif array_name[i][0..1]=="M "
      array_name[i][0..1]=array_name[i][0..1].delete("M ")
  end
end
array_name.delete("")
array_name.each{|name|
array_of_first_name<<name.split(" ")
}

return array_of_first_name
end




#def get_mail_depute
#page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719472"))
#mail = page.xpath('//dd[4]//li[2]/a')
#puts mail.text
#end


print deputes_names(scrap_mail)


