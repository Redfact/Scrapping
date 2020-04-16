	require 'open-uri'
	require 'nokogiri'

	

	def get_crypto_name()
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	names  = page.xpath("//div/a[contains(@href,'currencies/')]/text()")
		return names
	end

	def get_cryptos_prices()
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	priceswithvolume = page.xpath("//td/a[contains(@href,'currencies/')]/text()")
	prices = []
	i=0
	priceswithvolume.each_with_index { |val,i|
		if(i%2==0)then prices << val end 
	}

	return prices
	end

	def get_crypto_hash
		return Hash[get_crypto_name.zip(get_cryptos_prices)]
	end

def perform
	get_crypto_hash.each{ |key,value|
		puts "#{key} => #{value}"
	}

	
end

perform
