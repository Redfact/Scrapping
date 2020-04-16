require 'open-uri'
require 'nokogiri'

def get_townhall_email(url)
	source = Nokogiri::HTML(open(url))
	mail = source.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()')
	
	if(mail.empty?)then return "Error:No mail found"  end 
	return mail.text
end

def get_townhall_names
	source = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
	names = source.xpath("//p/a[contains(@href,'./95')]/text()")
	#convertit les elements en texts
	names = names.map { |e| e=e.text  }
	return names
end

def get_townhall_urls
	source = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
	urls = source.xpath("//p/a[contains(@href,'./95')]/@href")
	urls = urls.map { |e| e="https://www.annuaire-des-mairies.com"<<e.text[1..-1]  }
	return urls
end

def get_all_townhall_emails()
	urls = get_townhall_urls
	names = get_townhall_names
	mails = []
	urls.each_with_index do |mail,index|
		ml = get_townhall_email(mail)
		mails << ml
		print "#{names[index]} : #{ml} \n"
	end
	return Hash[names.zip(mails)]
end

def perform
	get_all_townhall_emails
end

perform