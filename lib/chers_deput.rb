require 'nokogiri'
require 'open-uri'

$principal_adress ="https://www2.assemblee-nationale.fr/"

def scrap_mail
  pages = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
end

def get_mail(array_of_link)
  array_of_link.each { |link|
    page = Nokogiri::HTML(URI.open($principal_adress + link))
    mail = page.xpath('div[3]/div/dl/dd[4]/ul/li[2]/a').text
    array_of_link << mail
  }
  return mail
end

def deputes_names(pages)
  array_of_first_name =[]
  array_name = []
  array_of_link = []
  links = pages.xpath('//*[@id="deputes-list"]//a')

  #Building Array Name
  links.each{ |link| array_name<<link.text }
  #Building array Link
  links.each{ |link| array_of_link<<link['href'] }
  
  array_of_link.delete(nil)
  puts array_of_link 

  #Cleaning array_name
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
  puts array_name

  #Building array of first name
  array_name.each{ |name| array_of_first_name<<name.split(" ") }
  return array_of_first_name
end

print deputes_names(scrap_mail)
