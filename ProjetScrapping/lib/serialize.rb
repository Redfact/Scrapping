
require 'csv'

class Serialize

#Prend un hash et le convertis en fichier JSON
	def self.hash_to_json(hash,name)
		puts "Converting hash into json file ..."
		file = open("#{name}","w")
		file.write(JSON.pretty_generate(hash))
	end

#Recupère un fichier JSON et le convertis en hash
	def self.json_to_hash(path_file)
		json = File.read(path_file)
		obj = JSON.parse(json)
		return obj
	end

	def self.save_as_spreadsheet(hash,namefile)
		#Ouvre une session google 
		session = GoogleDrive::Session.from_config('config.json')

		file = session.create_spreadsheet("spreadsheet")
		#Creer notre notre feuille spreadsheet et le stoche dans le array worsheets
		file.add_worksheet("mails",300,3)

		ws = file.worksheets[0]

		keys = hash.keys
		values = hash.values

		hash.size.times { |i|
			ws[i+1,1]=keys[i]
			ws[i+1,2]=values[i]
		}
		ws.save

		#Enregistre notre fichier name au format xlsx
		file.export_as_file("Res/#{namefile}.xlsx")

		puts "Hash saved correctly !"
	end

	#Convertit le hash en fichier csv
	def self.save_as_csv(hash,namefile)
		csv = CSV.open("Res/#{namefile}.csv","w") do |cs|
			hash.each { |k,v|  cs << [k,v] }	
		end

		return csv
	end


end