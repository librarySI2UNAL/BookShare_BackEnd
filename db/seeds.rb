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
=end

interest = Interest.create( name: "Artes" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Pencils.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create( name: "Fotografía" )
	interest.genres << genre

	genre = Genre.create( name: "Video" )
	interest.genres << genre

	genre = Genre.create( name: "Diseño gráfico" )
	interest.genres << genre

	genre = Genre.create( name: "Música" )
	interest.genres << genre

	genre = Genre.create( name: "Arte histórico" )
	interest.genres << genre

	genre = Genre.create( name: "Modas" )
	interest.genres << genre

	genre = Genre.create( name: "Artes escénicas" )
	interest.genres << genre

	genre = Genre.create( name: "Artes decorativas" )
	interest.genres << genre

	genre = Genre.create( name: "Artes religiosas" )
	interest.genres << genre

interest.save

interest = Interest.create( name: "Biografías" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Gabriel.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create( name: "Biografías históricas" )
	interest.genres << genre

	genre = Genre.create( name: "Personas importantes" )
	interest.genres << genre

	genre = Genre.create( name: "Memorias" )
	interest.genres << genre

	genre = Genre.create( name: "Profesionales y académicos" )
	interest.genres << genre

	genre = Genre.create( name: "Biografías deportivas" )
	interest.genres << genre

interest.save

interest = Interest.create( name: "Niños" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Childrens.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create( name: "Bebés" )
	interest.genres << genre

	genre = Genre.create( name: "Niños de 3 a 5 años" )
	interest.genres << genre

	genre = Genre.create( name: "Niños de 6 a 8 años" )
	interest.genres << genre

	genre = Genre.create( name: "Niños de 9 a 12 años" )
	interest.genres << genre

	genre = Genre.create( name: "Libros de mesa" )
	interest.genres << genre

	genre = Genre.create( name: "Libros para colorear" )
	interest.genres << genre

	genre = Genre.create( name: "Libros ilustrativos" )
	interest.genres << genre

interest.save
			
interest = Interest.create( name: "Historia" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/History.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create( name: "África" )
	interest.genres << genre

	genre = Genre.create( name: "América" )
	interest.genres << genre

	genre = Genre.create( name: "Europa" )
	interest.genres << genre

	genre = Genre.create( name: "Medio Este" )
	interest.genres << genre

	genre = Genre.create( name: "Asia" )
	interest.genres << genre

	genre = Genre.create( name: "Oceanía" )
	interest.genres << genre

	genre = Genre.create( name: "Historia militar" )
	interest.genres << genre

	genre = Genre.create( name: "Civilizaciones antiguas" )
	interest.genres << genre

interest.save

interest = Interest.create( name: "Literatura" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Literature.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create( name: "Literatura clásica" )
	interest.genres << genre

	genre = Genre.create( name: "Literatura contemporánea" )
	interest.genres << genre

	genre = Genre.create( name: "Epopeya" )
	interest.genres << genre

	genre = Genre.create( name: "Épica" )
	interest.genres << genre

	genre = Genre.create( name: "Novela" )
	interest.genres << genre

	genre = Genre.create( name: "Humor y sátira" )
	interest.genres << genre

interest.save

interest = Interest.create( name: "Ciencia ficción y fantasía" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Science_Fiction.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create( name: "Ficción" )
	interest.genres << genre

	genre = Genre.create( name: "Fantasía" )
	interest.genres << genre

	genre = Genre.create( name: "Historia alternativa" )
	interest.genres << genre

	genre = Genre.create( name: "Mitos y leyendas" )
	interest.genres << genre

	genre = Genre.create( name: "Paranormal" )
	interest.genres << genre

	genre = Genre.create( name: "Batallas y brujería" )
	interest.genres << genre

interest.save

interest = Interest.create( name: "Adultos jóvenes y adolescentes" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Teenager.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create( name: "Romance" )
	interest.genres << genre

	genre = Genre.create( name: "Salud personal" )
	interest.genres << genre

	genre = Genre.create( name: "Problemas sociales" )
	interest.genres << genre

interest.save

interest = Interest.create( name: "Cómics y novelas gráficas" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Comic.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create( name: "Manga" )
	interest.genres << genre

	genre = Genre.create( name: "Novelas gráficas" )
	interest.genres << genre

	genre = Genre.create( name: "Novelas gráficas de fantasía" )
	interest.genres << genre

	genre = Genre.create( name: "Superhéroes" )
	interest.genres << genre

interest.save

interest = Interest.create( name: "Cocina y licor" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Wine.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create( name: "Cocina oriental" )
	interest.genres << genre

	genre = Genre.create( name: "Cocina europea" )
	interest.genres << genre

	genre = Genre.create( name: "Gastronomía típica" )
	interest.genres << genre

	genre = Genre.create( name: "Bebidas" )
	interest.genres << genre

	genre = Genre.create( name: "Vino" )
	interest.genres << genre

	genre = Genre.create( name: "Postres" )
	interest.genres << genre

	genre = Genre.create( name: "Dietas" )
	interest.genres << genre

interest.save

interest = Interest.create( name: "Misterio, thrillers y suspenso" )
photo = Photo.new
photo.image = Rails.root.join( "public/images/Thriller.jpg" ).open
photo.save
interest.photo = photo

	genre = Genre.create( name: "Misterio" )
	interest.genres << genre

	genre = Genre.create( name: "Drama" )
	interest.genres << genre

	genre = Genre.create( name: "Acción" )
	interest.genres << genre

	genre = Genre.create( name: "Horror" )
	interest.genres << genre

	genre = Genre.create( name: "Terror" )
	interest.genres << genre

	genre = Genre.create( name: "Policías" )
	interest.genres << genre

	genre = Genre.create( name: "Investigadores" )
	interest.genres << genre

	genre = Genre.create( name: "Gobierno" )
	interest.genres << genre

interest.save