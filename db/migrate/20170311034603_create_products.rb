class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text :description
      t.boolean :special
      t.boolean :available
      t.string :product_type
      t.integer :product_id
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
