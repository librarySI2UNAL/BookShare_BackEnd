class BooksDAO
	def self.create_book( book_h )
		book = Book.new
		book.from_json( book_h.to_json )
		if !book.valid?
			return { success: false, errors: book.errors.full_messages }
		end

		book.save
		return { success: true, book: book }
	end
end