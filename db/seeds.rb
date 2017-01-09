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
PageInfo.create(page_id: 1, name: "title_region_map", content: "Découvrez une région")
PageInfo.create(page_id: 1, name: "title_category", content: "Bahia Blanca par thématique")


print "Creating user admin..."

User.create(first_name: "Claire", last_name:"Desto", email:"hola@bahiablanca.co", admin:true, password:"12345")

print "Creating  Article..."
a1 = Article.new(user_id:1, title:"C'est le grand départ pour Bahia blanca !")
a1.save

print "Creating  Regions et ses tables de jointure..."
Region.create(name:"Mexique", code:"MEX-ALL")
Region.create(name:"Yucatan", code:"MEX-YUC")
Region.create(name:"Chiapas", code:"MEX-CHP")

Region4a.create(region_id:1, article_id:1)
Region4a.create(region_id:3, article_id:1)

print "Creating  Categories et ses tables de jointure..."
Category.create(name:"Notre aventure", code:"AVENTURE")
Category.create(name:"Voyages", code:"VOYAGE")
Category.create(name:"Artisanat", code:"ART")

Category4a.create(category_id:1, article_id:1)

