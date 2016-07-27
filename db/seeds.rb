# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# pieces = Piece.create([{name:"Bedtime Stories" ,artist:"Ronald Ventura" ,price: 16191,birthdate: 1973,deathdate: nil},
# {name:"Ruth and Rose" ,artist: "Walasse Ting", price:68004,birthdate:1929 ,deathdate:2010},
# {name: "The Elegant Life of Mr H", artist: "Key Hiraga",price: 35621,birthdate: 1936,deathdate:2000}] )
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'artistGroupedArtData.csv'))
csv = CSV.parse(csv_text, :headers => false, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Piece.new
  t.name = row[0]
  t.artist = row[1]
  t.price = row[3]
  t.area = row[4]
  t.birthdate=row[5]
  t.deathdate = row[6]
  t.save
end