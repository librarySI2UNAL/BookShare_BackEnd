class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.text :description
      t.string :genre
      t.string :editorial
      t.integer :year_of_publication
      t.string :code_type
      t.string :code

      t.timestamps
    end
  end
end
