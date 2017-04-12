class InterestGenre < ApplicationRecord
	belongs_to :interest, :genre
end