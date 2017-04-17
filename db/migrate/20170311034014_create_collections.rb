class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :author
      t.string :editorial
      t.integer :year_of_publication
      t.float :qualification
      t.belongs_to :genre, index: true

      t.timestamps
    end
  end
end
