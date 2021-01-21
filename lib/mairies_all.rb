require 'nokogiri'
require 'open-uri'
require 'rubygems'

#Adresse web initiale ////

$principal_adress="http://annuaire-des-mairies.com"

# Scrapper
def scrapper
   return doc = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
end
# Création d'array_final
def get_mail(array_final,array_of_link)
  puts "CA VA PRENDRE UN PETIT PEU DE TEMPS, MAIS ÇA VIENT!"
    array_of_link.each{|link|
    pages=Nokogiri::HTML(URI.open($principal_adress+link))
    mail = pages.xpath('//section[2]//tr[4]/td[2]').text
    array_final << mail
    }
    return array_final
end

def fusiontab(tab1,tab2)
    return Hash[tab1.zip(tab2)]
end

def mairie(page)
    array_of_mail=[]
    array_of_link=[]
    array_of_name=[]

    links=page.xpath('//tr//td//p[1]//a')
    
    links.each{|link|
        array_of_name<<link.text
    }
    #j'enlève celui qui à rien a faire dedans
    array_of_name.delete("Plan du site")

    links.each{|link|
    array_of_link<<link['href']
    }
    #le dernier print ne doit pas être inclu, ici il est supprimé
    array_of_link.delete("plan-du-site.html")
    
    #j'enlève tout les "." devant l'adresse pour épurer
    for i in 0..array_of_link.length-1
        array_of_link[i][0]=array_of_link[i][0].delete(".")
    end
    get_mail(array_of_mail,array_of_link)
    hash=fusiontab(array_of_name,array_of_mail)
    return hash
end

print mairie(scrapper)
