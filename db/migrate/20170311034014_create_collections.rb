class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
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
      t.float :qualification
      t.belongs_to :genre, index: true

      t.timestamps
    end
  end
end
