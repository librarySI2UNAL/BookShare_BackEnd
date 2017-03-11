class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :placeId
      t.string :name

      t.timestamps
    end
  end
end
