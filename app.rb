require 'bundler'
Bundler.require

#Permet de recupérer une partie du chemin des fichiers lib
$:.unshift File.expand_path("./../ProjetScrapping/lib/", __FILE__)
require 'mairie'
require 'serialize'


hash_mails = Serialize.json_to_hash("test.json")
Serialize.save_as_csv(hash_mails,"spreadfile")

