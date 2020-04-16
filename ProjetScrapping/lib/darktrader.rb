	require 'open-uri'
	require 'nokogiri'

	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	cryptos = []
	cryptos  = page.xpath("//div/a[contains(@href,'currencies/')]")
	print cryptos
