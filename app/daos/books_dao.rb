class BooksDAO
	def self.assign_book( book, book_h )
		book.from_json( book_h.to_json )
		if !book.valid?
			return { success: false, errors: book.errors.full_messages }
		end

		book.save
		return { success: true, book: book }
	end

	def self.create_book( book_h )
		book = Book.new

		return self.assign_book( book, book_h )
	end

	def self.update_book( id, book_h )
		book = Book.load_book( id )
		if book == nil
			return { success: false, error: "The book was not found" }
		end

		return self.assign_book( book, book_h )
	end
end