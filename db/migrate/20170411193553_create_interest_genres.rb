class CreateInterestGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :interest_genres do |t|
      t.belongs_to :interest, index: true
      t.belongs_to :genre, index: true

      t.timestamps
    end
  end
end
