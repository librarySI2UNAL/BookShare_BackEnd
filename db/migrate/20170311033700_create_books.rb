class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.integer :cover
      t.integer :status
      t.string :author
      t.integer :genre
      t.string :editorial
      t.integer :year_of_publication
      t.string :code_type
      t.string :code

      t.timestamps
    end
  end
end
