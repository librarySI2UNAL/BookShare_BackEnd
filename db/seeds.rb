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

	interest = Interest.create(name: 'Childrens Book')

			genre = Genre.create(name: 'Baby to 2')
			interest.genres << genre

			genre = Genre.create(name: 'Ages 3 to 5')
			interest.genres << genre

			genre = Genre.create(name: 'Ages 6 to 8')
			interest.genres << genre

			genre = Genre.create(name: 'Ages 9 to 12')
			interest.genres << genre

			genre = Genre.create(name: 'Award winners')
			interest.genres << genre

			genre = Genre.create(name: "Children's books to read in lifetime")
			interest.genres  << genre

			genre = Genre.create(name: 'Education and reference')
			interest.genres  << genre

			genre = Genre.create(name: 'Best Books')
			interest.genres  << genre

interest = Interest.create(name: 'History')

				genre = Genre.create(name: 'Africa')
				interest.genres << genre

				genre = Genre.create(name: 'Americas')
				interest.genres << genre

				genre = Genre.create(name: 'Ancient Civilizations')
				interest.genres << genre

				genre = Genre.create(name: 'Europe')
				interest.genres << genre

				genre = Genre.create(name: 'Middle East')
				interest.genres << genre

				genre = Genre.create(name: 'Military')
				interest.genres  << genre

				genre = Genre.create(name: 'Russia')
				interest.genres  << genre

	interest = Interest.create(name: 'Literature & Fiction')

		genre = Genre.create(name: 'Classics')
		interest.genres << genre

		genre = Genre.create(name: 'Contemporary')
		interest.genres << genre

		genre = Genre.create(name: 'Essays')
		interest.genres << genre

		genre = Genre.create(name: 'Genre Fiction')
		interest.genres << genre

		genre = Genre.create(name: 'Historical Fiction')
		interest.genres << genre

		genre = Genre.create(name: 'Humor and satire')
		interest.genres  << genre

		genre = Genre.create(name: 'Literary')
		interest.genres  << genre


interest = Interest.create(name: 'Science Fiction and Fantasy')

			genre = Genre.create(name: 'Alternate History')
			interest.genres << genre

			genre = Genre.create(name: 'Epic')
			interest.genres << genre

			genre = Genre.create(name: 'Historical')
			interest.genres << genre

			genre = Genre.create(name: 'Military')
			interest.genres << genre

			genre = Genre.create(name: 'Myths and legends')
			interest.genres << genre

			genre = Genre.create(name: 'Paranormal')
			interest.genres << genre

			genre = Genre.create(name: 'Sword and sorcery')
			interest.genres << genre

interest = Interest.create(name: 'Teen and Young Adult Books')

		genre = Genre.create(name: 'Teen & Young Adult Romance')
		interest.genres << genre

		genre = Genre.create(name: 'Teen & Young Adult Literature & Fiction')
		interest.genres << genre

		genre = Genre.create(name: 'Teen & Young Adult Science Fiction & Fantasy')
		interest.genres << genre

		genre = Genre.create(name: 'Teen & Young Adult Mysteries & Thrillers')
		interest.genres << genre

		genre = Genre.create(name: 'Teen & Young Adult Personal Health')
		interest.genres << genre

		genre = Genre.create(name: 'Teen & Young Adult Adult Social Issues')
		interest.genres << genre

		genre = Genre.create(name: 'Teen & Young Adult Education & Reference')
		interest.genres << genre

		genre = Genre.create(name: 'Teen & Young Adult Biographies')
		interest.genres << genre

		genre = Genre.create(name: 'Teen & Young Adult Religion & Spirituality')
		interest.genres << genre


interest = Interest.create(name: 'Bussiness & Money')

				genre = Genre.create(name: 'Bussiness Management')
				interest.genres << genre

				genre = Genre.create(name: 'Investing')
				interest.genres << genre

				genre = Genre.create(name: 'Marketing & Sales')
				interest.genres << genre

				genre = Genre.create(name: 'Personal Finance')
				interest.genres << genre

				genre = Genre.create(name: 'Bussiness Culture')
				interest.genres << genre

				genre = Genre.create(name: 'Accounting')
				interest.genres << genre

				genre = Genre.create(name: 'Real Estate')
				interest.genres << genre

				genre = Genre.create(name: 'Biography & History')
				interest.genres << genre

				genre = Genre.create(name: 'Industries')
				interest.genres << genre

				genre = Genre.create(name: 'Bussiness Processes')
				interest.genres << genre


interest = Interest.create(name: 'Christian Books & Bibles')

			genre = Genre.create(name: 'Christian Bibles')
			interest.genres << genre

			genre = Genre.create(name: 'Christian Livings')
			interest.genres << genre

			genre = Genre.create(name: 'Bible Covers')
			interest.genres << genre

			genre = Genre.create(name: 'Christian Bible Study')
			interest.genres << genre

			genre = Genre.create(name: 'Christian Romance')
			interest.genres << genre

			genre = Genre.create(name: 'Catholicism')
			interest.genres << genre

			genre = Genre.create(name: 'Children & Teens Christian')
			interest.genres << genre

			genre = Genre.create(name: 'Christian Church & Bible')
			interest.genres << genre

			genre = Genre.create(name: 'Christian Ministry & Church')
			interest.genres << genre

			genre = Genre.create(name: 'Christian Evangelism')
			interest.genres << genre

interest = Interest.create(name: 'Comics & Graphic Novels')

		genre = Genre.create(name: 'Manga Comics & Graphic Novels')
		interest.genres << genre

		genre = Genre.create(name: 'Graphic Novels')
		interest.genres << genre

		genre = Genre.create(name: 'Superhero Comics & Graphic Novels')
		interest.genres << genre

		genre = Genre.create(name: 'Comic Books')
		interest.genres << genre

		genre = Genre.create(name: 'Romance Manga')
		interest.genres << genre

		genre = Genre.create(name: 'Comic & Graphic Novel')
		interest.genres << genre

		genre = Genre.create(name: 'Fantasy Graphic Novels')
		interest.genres << genre

		genre = Genre.create(name: 'Comic Strips')
		interest.genres << genre

		genre = Genre.create(name: 'Comic & Grapic Novels')
		interest.genres << genre

		genre = Genre.create(name: 'How To Create Comics & Manga')
		interest.genres << genre

interest = Interest.create(name: 'Computers & Technology')

			genre = Genre.create(name: 'Computer Programming')
			interest.genres << genre

			genre = Genre.create(name: 'Web Development & Design')
			interest.genres << genre

			genre = Genre.create(name: 'Programming Languages')
			interest.genres << genre

			genre = Genre.create(name: 'Network & Cloud Computing')
			interest.genres << genre

			genre = Genre.create(name: 'Computer Science')
			interest.genres << genre

			genre = Genre.create(name: 'Databases & Big Data')
			interest.genres << genre

			genre = Genre.create(name: 'Computer Hardware & DIY')
			interest.genres << genre

			genre = Genre.create(name: 'Computer Security & Encryption')
			interest.genres << genre

			genre = Genre.create(name: 'Internet & Social Media')
			interest.genres << genre

			genre = Genre.create(name: 'Computer Software')
			interest.genres << genre

interest = Interest.create(name: 'Cookbooks Food & Wine')

		genre = Genre.create(name: 'Asian cooking')
		interest.genres << genre

		genre = Genre.create(name: 'Baking')
		interest.genres << genre

		genre = Genre.create(name: 'Beverages & Wine')
		interest.genres << genre

		genre = Genre.create(name: 'Baking')
		interest.genres << genre

		genre = Genre.create(name: '100 Books For Foodies')
		interest.genres << genre

		genre = Genre.create(name: 'Desserts')
		interest.genres << genre

		genre = Genre.create(name: 'Italian Cooking')
		interest.genres << genre

		genre = Genre.create(name: 'Special Diet')
		interest.genres << genre

interest = Interest.create(name: 'Cookbooks Food & Wine')

			genre = Genre.create(name: 'Crafts & Hobbies')
			interest.genres << genre

			genre = Genre.create(name: 'Home Improvement & Design Books')
			interest.genres << genre

			genre = Genre.create(name: 'Coloring Books for Grown Ups')
			interest.genres << genre

			genre = Genre.create(name: 'Coloring Books for Grown Ups')
			interest.genres << genre

			genre = Genre.create(name: 'Gardering & Landscape Design')
			interest.genres << genre

			genre = Genre.create(name: 'Needlecrafts & Textile Crafts')
			interest.genres << genre

			genre = Genre.create(name: 'Antiques & Collectibles')
			interest.genres << genre

			genre = Genre.create(name: 'Animal & Pet Care')
			interest.genres << genre

			genre = Genre.create(name: 'Sustainable Living')
			interest.genres << genre

interest = Interest.create(name: 'Education & Teaching')

			genre = Genre.create(name: 'Schools & Teaching')
			interest.genres << genre

			genre = Genre.create(name: 'Test Preparation')
			interest.genres << genre

			genre = Genre.create(name: 'Study Guides & Workbooks')
			interest.genres << genre

			genre = Genre.create(name: 'Higher & Continuing Education')
			interest.genres << genre

interest = Interest.create(name: 'Engineering & Transportation')

			genre = Genre.create(name: 'Engineering')
			interest.genres << genre

			genre = Genre.create(name: 'Automotive')
			interest.genres << genre

			genre = Genre.create(name: 'Transportation')
			interest.genres << genre

interest = Interest.create(name: 'Gay & Lesbian')

		genre = Genre.create(name: 'Gay & Lesbian Literature')
		interest.genres << genre

		genre = Genre.create(name: 'Gay & Lesbian Biographies')
		interest.genres << genre

		genre = Genre.create(name: 'Gay & Lesbian History')
		interest.genres << genre

		genre = Genre.create(name: 'Gay & Lesbian Mystery')
		interest.genres << genre

		genre = Genre.create(name: 'Gay & Lesbian Parenting')
		interest.genres << genre

		genre = Genre.create(name: 'Gay & Lesbian Travel')
		interest.genres << genre

interest = Interest.create(name: 'Health, Fitness & Dieting')

			genre = Genre.create(name: 'Diets & weight Loss')
			interest.genres << genre

			genre = Genre.create(name: 'Exercise & Fitness')
			interest.genres << genre

			genre = Genre.create(name: 'Alternative Medicine')
			interest.genres << genre

			genre = Genre.create(name: 'Nutrition')
			interest.genres << genre

			genre = Genre.create(name: 'Psychology & Counseling')
			interest.genres << genre

			genre = Genre.create(name: 'Sexual Health')
			interest.genres << genre

			genre = Genre.create(name: 'Grooming & Style')
			interest.genres << genre

			genre = Genre.create(name: "Women's Health")
			interest.genres << genre

			genre = Genre.create(name: "Men's Health")
			interest.genres << genre

			genre = Genre.create(name: 'Health, Mind & Body Reference')
			interest.genres << genre

interest = Interest.create(name: 'Humor & Entertainment')

			genre = Genre.create(name: 'Humor')
			interest.genres << genre

			genre = Genre.create(name: 'Sheet Music & Scores')
			interest.genres << genre

			genre = Genre.create(name: 'Coloring Books For Growing-Ups')
			interest.genres << genre

			genre = Genre.create(name: 'Puzzles & Games')
			interest.genres << genre

			genre = Genre.create(name: 'Performing Arts')
			interest.genres << genre

			genre = Genre.create(name: 'Movies')
			interest.genres << genre

			genre = Genre.create(name: 'Trivia & Fun Facts')
			interest.genres << genre

			genre = Genre.create(name: 'Pop Culture')
			interest.genres << genre

			genre = Genre.create(name: 'Television')
			interest.genres << genre

			genre = Genre.create(name: 'Radio')
			interest.genres << genre

interest = Interest.create(name: 'Law')

			genre = Genre.create(name: 'Criminal Law')
			interest.genres << genre

			genre = Genre.create(name: 'Constitutional Law')
			interest.genres << genre

			genre = Genre.create(name: 'Legal Rules & Procedures')
			interest.genres << genre

			genre = Genre.create(name: 'Lawyer & Judge Biographies')
			interest.genres << genre

			genre = Genre.create(name: 'Legal Education')
			interest.genres << genre

			genre = Genre.create(name: 'Foreign and International Love')
			interest.genres << genre

			genre = Genre.create(name: 'Legal History')
			interest.genres << genre

			genre = Genre.create(name: 'Tax Law')
			interest.genres << genre

			genre = Genre.create(name: 'Media & The Law')
			interest.genres << genre

			genre = Genre.create(name: 'Intelectual Property Law')
			interest.genres << genre


interest = Interest.create(name: 'Medical Books & Textbooks')

			genre = Genre.create(name: 'Medicine')
			interest.genres << genre

			genre = Genre.create(name: 'Nursing')
			interest.genres << genre

			genre = Genre.create(name: 'Medicine')
			interest.genres << genre

			genre = Genre.create(name: 'Pharmacology')
			interest.genres << genre

			genre = Genre.create(name: 'Veterinary Medicine')
			interest.genres << genre

			genre = Genre.create(name: 'Medical Psychology')
			interest.genres << genre

			genre = Genre.create(name: 'Basical Medic Sciences')
			interest.genres << genre

			genre = Genre.create(name: 'Medical Informatics')
			interest.genres << genre

			genre = Genre.create(name: 'History Of Medicine')
			interest.genres << genre

			genre = Genre.create(name: 'Allied Health Professions')
			interest.genres << genre

			genre = Genre.create(name: 'Medical Administration')
			interest.genres << genre

interest = Interest.create(name: 'Parenting & Relationships')

			genre = Genre.create(name: 'Marriage')
			interest.genres << genre

			genre = Genre.create(name: 'Parenting')
			interest.genres << genre

			genre = Genre.create(name: 'Pregnancy & Childbirth')
			interest.genres << genre

			genre = Genre.create(name: 'Family Relationship')
			interest.genres << genre

			genre = Genre.create(name: 'Parenting & Families Humor')
			interest.genres << genre

			genre = Genre.create(name: 'Parenting & Family Reference')
			interest.genres << genre

			genre = Genre.create(name: 'Special Needs Parenting')
			interest.genres << genre

			genre = Genre.create(name: 'Family Health')
			interest.genres << genre

			genre = Genre.create(name: 'Family Activity')
			interest.genres << genre

			genre = Genre.create(name: 'Aging Parents')
			interest.genres << genre



interest = Interest.create(name: 'Politics & Social Sciences')

			genre = Genre.create(name: 'Politics & Government')
			interest.genres << genre

			genre = Genre.create(name: 'Social Sciences')
			interest.genres << genre

			genre = Genre.create(name: 'Philosophy')
			interest.genres << genre

			genre = Genre.create(name: 'Sociology')
			interest.genres << genre

			genre = Genre.create(name: 'Politics & Government')
			interest.genres << genre

			genre = Genre.create(name: 'Anthropology')
			interest.genres << genre

			genre = Genre.create(name: 'Women Studies')
			interest.genres << genre

interest = Interest.create(name: 'Reference')

			genre = Genre.create(name: 'Test Preparation')
			interest.genres << genre

			genre = Genre.create(name: 'Atlases & Maps')
			interest.genres << genre

			genre = Genre.create(name: 'English As A Second Language')
			interest.genres << genre

			genre = Genre.create(name: 'Writing, Research & Publishing')
			interest.genres << genre

			genre = Genre.create(name: 'Job Hunting And Careers')
			interest.genres << genre

			genre = Genre.create(name: 'Survival & Emergency Preparedness')
			interest.genres << genre

			genre = Genre.create(name: 'Enciclopedias & Subject Guides')
			interest.genres << genre

			genre = Genre.create(name: 'Catalogs & Directories')
			interest.genres << genre

			genre = Genre.create(name: 'Genealogy')
			interest.genres << genre

			genre = Genre.create(name: 'Consumer Guides')
			interest.genres << genre

interest = Interest.create(name: 'Religion & Spirituality')

			genre = Genre.create(name: 'Christian Books & Bibles')
			interest.genres << genre

			genre = Genre.create(name: 'New Age & Spirituality')
			interest.genres << genre

			genre = Genre.create(name: 'Occult & Paranormal')
			interest.genres << genre

			genre = Genre.create(name: 'Buddhism')
			interest.genres << genre

			genre = Genre.create(name: 'Islam')
			interest.genres << genre

			genre = Genre.create(name: 'Hinduism')
			interest.genres << genre

			genre = Genre.create(name: 'Judaism')
			interest.genres << genre

			genre = Genre.create(name: 'Other Religions, Pratices & sacred Texts')
			interest.genres << genre

			genre = Genre.create(name: 'Religious Arts & Photography')
			interest.genres << genre

			genre = Genre.create(name: 'Religious Literature & Fiction')
			interest.genres << genre

interest = Interest.create(name: 'Self-Help')

			genre = Genre.create(name: 'Personal Transformation')
			interest.genres << genre

			genre = Genre.create(name: 'Healthy Relationships')
			interest.genres << genre

			genre = Genre.create(name: 'Motivational Self-Help')
			interest.genres << genre

			genre = Genre.create(name: 'Human Sexuality')
			interest.genres << genre

			genre = Genre.create(name: 'Happiness Self-Help')
			interest.genres << genre

			genre = Genre.create(name: 'Communication & Social Skills')
			interest.genres << genre

			genre = Genre.create(name: 'Stress Management Self-Help')
			interest.genres << genre

			genre = Genre.create(name: 'Emotional Self-Help')
			interest.genres << genre

			genre = Genre.create(name: 'Dreams')
			interest.genres << genre

			genre = Genre.create(name: 'Anxieties & Fobias')
			interest.genres << genre

interest = Interest.create(name: 'Travel')

			genre = Genre.create(name: 'US Travel Guides')
			interest.genres << genre

			genre = Genre.create(name: 'SouthAmerican Travel Guides')
			interest.genres << genre

			genre = Genre.create(name: 'European Travel Guides')
			interest.genres << genre

			genre = Genre.create(name: 'Middle East Travel Guides')
			interest.genres << genre

			genre = Genre.create(name: 'African Travel Guides')
			interest.genres << genre

			genre = Genre.create(name: 'Caribbean Travel Guides')
			interest.genres << genre

			genre = Genre.create(name: 'Travel Pictorial Reference')
			interest.genres << genre

			genre = Genre.create(name: 'Speciality Travel')
			interest.genres << genre

			genre = Genre.create(name: 'Travel  Reference & Tips')
			interest.genres << genre

			genre = Genre.create(name: 'Mexico Travel Guides')
			interest.genres << genre




#Agregar daos y controladores de los comentarios
