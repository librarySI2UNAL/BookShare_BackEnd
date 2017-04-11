# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
Status
1 - Terrible
2 - Bad
3 - Regular
4 - Good
5 - Excellent

Cover
1 - Paperback
2 - Hardcover

Genre
1 - Novel
2 - Tragedy
3 - Mistery
4 - Sci-Fi
=end

=begin
book = Book.create( name: "Cien años de soledad", description: nil, cover: 1, status: 5,
	author: "Gabriel García Márquez", genre: 1, editorial: "Vintage", year_of_publication: 2009,
	code_type: "ISBN", code: "978-0307474728" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "El amor en los tiempos del cólera", description: nil, cover: 1, status: 5,
	author: "Gabriel García Márquez", genre: 1, editorial: "Vintage", year_of_publication: 2007,
	code_type: "ISBN", code: "978-0307387264" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "Crónica de una muerte anunciada", description: nil, cover: 1, status: 5,
	author: "Gabriel García Márquez", genre: 1, editorial: "Vintage", year_of_publication: 2003,
	code_type: "ISBN", code: "978-1400034956" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "El coronel no tiene quien le escriba", description: nil, cover: 1, status: 5,
	author: "Gabriel García Márquez", genre: 1, editorial: "Vintage", year_of_publication: 2010,
	code_type: "ISBN", code: "978-0307475442" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "Del amor y otros demonios", description: nil, cover: 1, status: 5,
	author: "Gabriel García Márquez", genre: 1, editorial: "Vintage", year_of_publication: 2010,
	code_type: "ISBN", code: "978-0307475350" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "Romeo y Julieta", description: nil, cover: 1, status: 5,
	author: "William Shakespeare", genre: 2, editorial: "CreateSpace", year_of_publication: 2016,
	code_type: "ISBN", code: "978-1539915904" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "Hamlet", description: nil, cover: 1, status: 5,
	author: "William Shakespeare", genre: 2, editorial: "CreateSpace", year_of_publication: 2016,
	code_type: "ISBN", code: "978-1544862743" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "Macbeth", description: nil, cover: 1, status: 5,
	author: "William Shakespeare", genre: 2, editorial: "CreateSpace", year_of_publication: 2016,
	code_type: "ISBN", code: "978-1523207312" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "It: A Novel", description: nil, cover: 1, status: 5,
	author: "Stephen King", genre: 3, editorial: "Scribner", year_of_publication: 2016,
	code_type: "ISBN", code: "978-1501142970" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "The Shining", description: nil, cover: 1, status: 5,
	author: "Stephen King", genre: 3, editorial: "Anchor", year_of_publication: 2016,
	code_type: "ISBN", code: "978-0307743657" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "Carrie", description: nil, cover: 1, status: 5,
	author: "Stephen King", genre: 3, editorial: "Doubleday", year_of_publication: 2007,
	code_type: "ISBN", code: "978-0385086950" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "Thrawn (Star Wars)", description: nil, cover: 1, status: 5,
	author: "Timithy Zahn", genre: 4, editorial: "Del Rey", year_of_publication: 2017,
	code_type: "ISBN", code: "978-0345511270" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "Bloodline (Star Wars)", description: nil, cover: 1, status: 5,
	author: "Claudia Gray", genre: 4, editorial: "Del Rey", year_of_publication: 2017,
	code_type: "ISBN", code: "978-1101885260" )
Product.create( description: nil, special: true, available: true, product_item: book )
book = Book.create( name: "Heir to the Jedi: Star Wars", description: nil, cover: 1, status: 5,
	author: "Kevin Hearne", genre: 4, editorial: "Del Rey", year_of_publication: 2015,
	code_type: "ISBN", code: "978-0345544865" )
Product.create( description: nil, special: true, available: true, product_item: book )

collection = Collection.create( name: "Saga de Harry Potter", description: nil, cover: 1, status: 5,
	author: "J.K. Rowling", genre: 1, editorial: "Bloomsbury Publishing", year_of_publication: 1997,
	code_type: "ISBN", code: "978-0545162074" )
Product.create( description: nil, special: true, available: true, product_item: collection )
collection = Collection.create( name: "The Maze Runner Series", description: nil, cover: 1, status: 5,
	author: "James Dashner", genre: 3, editorial: "Delacorte Press", year_of_publication: 2014,
	code_type: "ISBN", code: "978-0385388894" )
Product.create( description: nil, special: true, available: true, product_item: collection )
collection = Collection.create( name: "The Hobbit and the Lord of the Rings", description: nil, cover: 1, status: 5,
	author: "J.R.R. Tolkien", genre: 3, editorial: "Delacorte Press", year_of_publication: 2012,
	code_type: "ISBN", code: "978-0345538376" )
Product.create( description: nil, special: true, available: true, product_item: collection )

User.create( name: "Iván", last_name: "Rojas", email: "ivan@email.com", password: "ivan123" )
User.create( name: "Edilberto", last_name: "Cañón", email: "edilberto@email.com", password: "edilberto123" )
User.create( name: "Miguel", last_name: "Cuesta", email: "miguel.cuesta@email.com", password: "miguel123" )
User.create( name: "Miguel", last_name: "Ballén", email: "miguel@email.com", password: "miguel123" )
User.create( name: "David", last_name: "Beltrán", email: "david@email.com", password: "david123" )
User.create( name: "Jorge", last_name: "Solano", email: "jorge@email.com", password: "jorge123" )
=end


interest = Interest.create(name: 'Arts & Photography')

	genre = Genre.create(name: 'Photography')
	interest.genres << genre

	genre = Genre.create(name: 'Video')
	interest.genres << genre

	genre = Genre.create(name: 'Graphic Design')
	interest.genres << genre

	genre = Genre.create(name: 'Music')
	interest.genres << genre

	genre = Genre.create(name: 'Art History')
	interest.genres << genre

	genre = Genre.create(name: 'Fashion')
	interest.genres  << genre

	genre = Genre.create(name: 'Performing Arts')
	interest.genres  << genre

	genre = Genre.create(name: 'Decorative Arts')
	interest.genres  << genre

	genre = Genre.create(name: 'Religious Arts')
	interest.genres  << genre



interest = Interest.create(name: 'Biographies')

	genre = Genre.create(name: 'Historical')
	interest.genres  << genre

	genre = Genre.create(name: 'Leaders and notable people')
	interest.genres  << genre

	genre = Genre.create(name: 'Memoirs')
	interest.genres  << genre

	genre = Genre.create(name: 'Professionals and academics')
	interest.genres  << genre

	genre = Genre.create(name: 'Sports and outdoors')
	interest.genres  << genre

	genre = Genre.create(name: 'Travelers and explorers')
	interest.genres  << genre

	genre = Genre.create(name: 'True crime')
	interest.genres  << genre
