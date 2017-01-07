# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print "Creating pages..."

p = Page.new(name: "Blog Homepage", path:"root_path")
p.save

print "Creating page info......"

PageInfo.create(page_id: 1, name: "Page h1", content: "Découvez le Mexique avec nous !")
PageInfo.create(page_id: 1, name: "Page Description", content: "L'équipe de Bahia Blanca embarque le 31 janvier pour un périple au Mexique afin de découvrir en profondeur l'artisanat mexicain et trouver les artisans qui produiront la nouvelle collection 2017 de Bahia Blanca.")
PageInfo.create(page_id: 1, name: "Titre Compte à Rebours", content: "Temps restant avant le grand départ")
PageInfo.create(page_id: 1, name: "Titre 1e card", content: "Artisanat")
PageInfo.create(page_id: 1, name: "Content 1e card", content: "Découvrez les artisans du Mexique et les spécificités régionales")
PageInfo.create(page_id: 1, name: "Titre 2e card", content: "Voyages")
PageInfo.create(page_id: 1, name: "Content 2e card", content: "Voyagez avec nous en découvrant nos coups de cœurs sur place")

print "Creating user admin..."

User.create(email:"hola@bahiablanca.co", admin:true, password:"Bahiablanca92!")
