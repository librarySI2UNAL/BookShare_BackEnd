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

interest = Interest.create( name: "Artes y fotografía" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Pencils.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create(name: 'Fotografía')
	interest.genres << genre

	genre = Genre.create(name: 'Video')
	interest.genres << genre

	genre = Genre.create(name: 'Diseño gráfico')
	interest.genres << genre

	genre = Genre.create(name: 'Música')
	interest.genres << genre

	genre = Genre.create(name: 'Arte e historia')
	interest.genres << genre

	genre = Genre.create(name: 'Modas')
	interest.genres  << genre

	genre = Genre.create(name: 'Artes escénicas')
	interest.genres  << genre

	genre = Genre.create(name: 'Artes decorativas')
	interest.genres  << genre

	genre = Genre.create(name: 'Artes religiosas')
	interest.genres  << genre

interest.save

interest = Interest.create( name: "Biografías" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Gabriel.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create(name: 'Históricos')
	interest.genres  << genre

	genre = Genre.create(name: 'Personas importantes')
	interest.genres  << genre

	genre = Genre.create(name: 'Memorias')
	interest.genres  << genre

	genre = Genre.create(name: 'Profesionales y académicas')
	interest.genres  << genre

	genre = Genre.create(name: 'Deportes y espacios')
	interest.genres  << genre

	genre = Genre.create(name: 'Viajes y exploración')
	interest.genres  << genre

	genre = Genre.create(name: 'Crímenes reales')
	interest.genres  << genre

interest.save

interest = Interest.create( name: "Libros para niños" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Childrens.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create(name: 'bebes de 2 años')
	interest.genres << genre

	genre = Genre.create(name: 'Edades de 3 a 5 años' )
	interest.genres << genre

	genre = Genre.create(name: 'Edades 6 a 8 años')
	interest.genres << genre

	genre = Genre.create(name: 'Edades 9 a 12 años')
	interest.genres << genre

	genre = Genre.create(name: 'Libros de mesa')
	interest.genres << genre

	genre = Genre.create(name: 'Libros por capítulos')
	interest.genres << genre

	genre = Genre.create(name: 'Libros para colorear')
	interest.genres << genre

	genre = Genre.create(name: 'Libros ilustrados')
	interest.genres << genre

interest.save
			
interest = Interest.create( name: "Historia" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/History.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create(name: 'África')
	interest.genres << genre

	genre = Genre.create(name: 'Américas')
	interest.genres << genre

	genre = Genre.create(name: 'Civilizaciones antiguas')
	interest.genres << genre

	genre = Genre.create(name: 'Europa')
	interest.genres << genre

	genre = Genre.create(name: 'Medio Este')
	interest.genres << genre

	genre = Genre.create(name: 'Militar')
	interest.genres  << genre

	genre = Genre.create(name: 'Rusia')
	interest.genres  << genre

interest.save

interest = Interest.create( name: "Literatura y ficción" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Literature.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create(name: 'Clásicos')
	interest.genres << genre

	genre = Genre.create(name: 'Contemporáneo')
	interest.genres << genre

	genre = Genre.create(name: 'Ensayos')
	interest.genres << genre

	genre = Genre.create(name: 'Ficción')
	interest.genres << genre

	genre = Genre.create(name: 'Ficción histórica')
	interest.genres << genre

	genre = Genre.create(name: 'Humor y sátira')
	interest.genres  << genre

	genre = Genre.create(name: 'Literario')
	interest.genres  << genre

interest.save

interest = Interest.create( name: "Ciencia ficción y fantasía" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Science_Fiction.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create(name: 'Historia alternativa')
	interest.genres << genre

	genre = Genre.create(name: 'Épico')
	interest.genres << genre

	genre = Genre.create(name: 'Histórico')
	interest.genres << genre

	genre = Genre.create(name: 'Militar')
	interest.genres << genre

	genre = Genre.create(name: 'Mitos y leyendas')
	interest.genres << genre

	genre = Genre.create(name: 'Paranormal')
	interest.genres << genre

	genre = Genre.create(name: 'Espadas y brujería')
	interest.genres << genre

interest.save

interest = Interest.create( name: "Libros de adultos jóvenes y adolescentes" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Teenager.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create(name: 'Adultos jóvenes y adolescentes - Romance')
	interest.genres << genre

	genre = Genre.create(name: 'Adultos jóvenes y adolescentes - Ficción')
	interest.genres << genre

	genre = Genre.create(name: 'Adultos jóvenes y adolescentes - Fantasía')
	interest.genres << genre

	genre = Genre.create(name: 'Adultos jóvenes y adolescentes - Misterio y thrillers')
	interest.genres << genre

	genre = Genre.create(name: 'Adultos jóvenes y adolescentes - Salud personal')
	interest.genres << genre

	genre = Genre.create(name: 'Adultos jóvenes y adolescentes - Problemas sociales')
	interest.genres << genre

	genre = Genre.create(name: 'Adultos jóvenes y adolescentes - Educación')
	interest.genres << genre

	genre = Genre.create(name: 'Adultos jóvenes y adolescentes - Biografías')
	interest.genres << genre

	genre = Genre.create(name: 'Adultos jóvenes y adolescentes - Religión y espiritualidad')
	interest.genres << genre

interest.save

interest = Interest.create( name: "Cómics y novelas gráficas" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Comic.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create(name: 'Manga y novelas gráficas')
	interest.genres << genre

	genre = Genre.create(name: 'Novelas gráficas')
	interest.genres << genre

	genre = Genre.create(name: 'Superhéroes')
	interest.genres << genre

	genre = Genre.create(name: 'Libros')
	interest.genres << genre

	genre = Genre.create(name: 'Romance manga')
	interest.genres << genre

	genre = Genre.create(name: 'Novelas gráficas de fantasía')
	interest.genres << genre

interest.save

interest = Interest.create( name: "Libros de cocina, comida y licor" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Wine.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create(name: 'Cocina Asiática')
	interest.genres << genre

	genre = Genre.create(name: 'Bebidas y vino')
	interest.genres << genre

	genre = Genre.create(name: 'Horneado')
	interest.genres << genre

	genre = Genre.create(name: 'Postres')
	interest.genres << genre

	genre = Genre.create(name: 'Cocina italiana')
	interest.genres << genre

	genre = Genre.create(name: 'Dietas')
	interest.genres << genre

interest.save

interest = Interest.create( name: "Misterio, thrillers y suspenso" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Thriller.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create(name: 'Acción')
	interest.genres << genre

	genre = Genre.create(name: 'Horror')
	interest.genres << genre

	genre = Genre.create(name: 'Humor')
	interest.genres << genre

	genre = Genre.create(name: 'Militares')
	interest.genres << genre

	genre = Genre.create(name: 'Policías')
	interest.genres << genre

	genre = Genre.create(name: 'Investigadores')
	interest.genres << genre

	genre = Genre.create(name: 'Agentes del gobierno')
	interest.genres << genre

interest.save
	
begin
genre = Genre.find_by_id( 38 )
user = User.find_by_id( 1 )

book = Book.create( name: "Anna Karenina", author: "Leo Tolstoy", genre: genre, editorial: "Editorial", year_of_publication: 1947 )
Product.create( special: true, available: true, cover: 1, status: 5, value: 80000, code: "ISBN", code_type: "12344562323", product_item: book, user: user )

book = Book.create( name: "La guerra y la paz", author: "Leon Tolstoy", genre: genre, editorial: "Editorial", year_of_publication: 1927 )
Product.create( special: true, available: true, cover: 2, status: 4, value: 55000, code: "ISBN", code_type: "12346767323", product_item: book, user: user )

book = Book.create( name: "Las Aventuras de Huckleberry Finn", author: "Mark Twain", genre: genre, editorial: "Editorial", year_of_publication: 1947 )
Product.create( special: false, available: true, cover: 1, status: 4, value: 60000, code: "ISBN", code_type: "12342345523", product_item: book, user: user )

book = Book.create( name: "Hamlet", author: "William Shakespeare", genre: genre, editorial: "Editorial", year_of_publication: 1947 )
Product.create( special: true, available: true, cover: 1, status: 5, value: 80000, code: "ISBN", code_type: "12343542323", product_item: book, user: user )

book = Book.create( name: "En busca del tiempo perdido", author: "Marcel Proust", genre: genre, editorial: "Editorial", year_of_publication: 1987 )
Product.create( special: true, available: true, cover: 2, status: 3, value: 50000, code: "ISBN", code_type: "12344562323", product_item: book, user: user )

book = Book.create( name: "La Biblia", author: "Varios", genre: genre, editorial: "Editorial", year_of_publication:1500 )
Product.create( special: false, available: true, cover: 1, status: 5, value: 30000, code: "ISBN", code_type: "1236542323", product_item: book, user: user )

book = Book.create( name: "Don Quijote de la Mancha", author: "Miguel de Cervantes", genre: genre, editorial: "Editorial", year_of_publication: 1649 )
Product.create( special: true, available: true, cover: 1, status: 4, value: 75000, code: "ISBN", code_type: "12342322456", product_item: book, user: user )

book = Book.create( name: "El Señor de los Anillos", author: "J.R.R Tolkien", genre: genre, editorial: "Editorial", year_of_publication: 1925 )
Product.create( special: true, available: true, cover: 2, status: 5, value: 150000, code: "ISBN", code_type: "133342322323", product_item: book, user: user )

book = Book.create( name: "El Principito", author: "Antoine de Saint Exupery", genre: genre, editorial: "Editorial", year_of_publication: 1899 )
Product.create( special: false, available: true, cover: 1, status: 4, value: 45000, code: "ISBN", code_type: "12344562323", product_item: book, user: user )

book = Book.create( name: "1984", author: "George Orwell", genre: genre, editorial: "Editorial", year_of_publication: 1984 )
Product.create( special: true, available: true, cover: 2, status: 4, value: 75000, code: "ISBN", code_type: "12342234323", product_item: book, user: user )

book = Book.create( name: "Crimen y Castigo", author: "Fiodor Dostoievski", genre: genre, editorial: "Editorial", year_of_publication: 1975 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 45000, code: "ISBN", code_type: "12342656523", product_item: book, user: user )

book = Book.create( name: "La Divina Comedia", author: "Dante Alighieri", genre: genre, editorial: "Editorial", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )


book = Book.create( name: "Presupuesto: su control en un proyecto arquitectónico (3a ed.)", author: "González Forero, Hernando
Ecoe Ediciones ", genre: genre, editorial: "Ecoe Ediciones", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )

book = Book.create( name: "Literatura inglesa: problemas y técnicas en la traducción e interpretación de sus textos", author: "Sainero Sánchez, Ramón", genre: genre, editorial: "Educación a Distancia", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )

book = Book.create( name: "Biología celular", author: "Paniagua, Ricardo", genre: genre, editorial: "McGraw-Hill España", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )

book = Book.create( name: "Gastroenterología", author: "Vargas Domínguez, Armando", genre: genre, editorial: "McGraw-Hill Interamericana", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )

book = Book.create( name: "Decisiones estratégicas: macroadministración", author: "Mendoza Guerra, José María", genre: genre, editorial: "Ediciones de la U", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )


book = Book.create( name: "Métodos para la resolución de ecuaciones diferenciales ordinarias", author: "Caicedo, Alfredo", genre: genre, editorial: "Editorial", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )


book = Book.create( name: "Comunicación, cultura y sociedad", author: "Pedranti, Gabriela", genre: genre, editorial: "Editorial Maipue", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )

book = Book.create( name: "Nanotecnología: descubriendo lo invisible", author: "ndrada, Ana María", genre: genre, editorial: "Editorial Maipue", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )


book = Book.create( name: "Memorias de un funcionario", author: "Livingston, Rodolfo", genre: genre, editorial: "Editorial Nobuko", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )

book = Book.create( name: "Qué hacer cuando la persona a la que queremos ejerce un dominio excesivo sobre nosotros", author: "tenack, Richard J.", genre: genre, editorial: "Editorial Desclée de Brouwer", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )

book = Book.create( name: "No sólo de pan...", author: "Rincón Bernal Jorge del ", genre: genre, editorial: "Editorial", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )

book = Book.create(  name: "Principios, fines y derechos fundamentales", author: "Rodríguez, Joaquín Muñiz, Toubes ", genre: genre, editorial: "Dykinson ", year_of_publication: 1845 )
Product.create( special: true, available: true, cover: 1, status: 3, value: 75000, code: "ISBN", code_type: "12377652323", product_item: book, user: user )

end