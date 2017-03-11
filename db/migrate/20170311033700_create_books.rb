class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.string :cover
      t.string :status
      t.string :author
      t.string :genre
      t.string :editorial
      t.integer :year_of_publication
      t.string :code_type
      t.string :code
      t.belongs_to :collection, index: true

      t.timestamps
    end
  end
end
