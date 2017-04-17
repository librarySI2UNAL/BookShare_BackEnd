class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text :description
      t.boolean :special
      t.boolean :available
      t.integer :cover
      t.integer :status
      t.integer :value
      t.string :code_type
      t.string :code
      t.references :product_item, polymorphic: true, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
