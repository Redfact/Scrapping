require 'open-uri'
require 'nokogiri'


def get_depute_email(url)
	source = Nokogiri::HTML(open(url))
	mail = source.xpath("//li[contains(text(),'Mél')]/a[contains(@href,'mailto')]/text()")
	if(mail.empty?)then return "Error:No mail found"  end 
	return mail[0].text
end

def get_deputes_names
	source = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	names = source.xpath("//li/a[contains(@href,'/deputes/')]/text()")
	#convertit les elements en texts
	names = names.map { |e| e=e.text  }
	return names
end

def get_urls_for_mails
	source = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	urls = source.xpath("//li/a[contains(@href,'/deputes/')]/@href")
	urls = urls.map { |e| e="http://www2.assemblee-nationale.fr/"<<e.text}
	return urls	
end

def get_deputes_mails
	mails= []
	names = get_deputes_names
	urls = get_urls_for_mails
	urls.each_with_index do |el,i|
		mail = get_depute_email(el)
		print "#{names[i]} => #{mail} \n"
		mails<<mail
		#Mettre cette ligne pour limiter les données à 20
		if( i>20)then break end
	end

	return Hash[names.zip(mails)]

end

get_deputes_mails