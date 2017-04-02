# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

book = Book.create( name: "Cien años de soledad", description: nil, cover: "Gruesa", status: true,
	author: "Gabriel García Márquez", genre: "Novela", editorial: "Harper", year_of_publication: 1967,
	code_type: "ISBN", code: "9789631420494" )
Product.create( description: nil, special: true, available: true, product_item: book )