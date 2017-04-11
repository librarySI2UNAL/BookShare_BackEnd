class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text :description
      t.boolean :special
      t.boolean :available
      t.integer :value
      t.decimal :qualification
      t.references :product_item, polymorphic: true, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
