class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :place_id
      t.string :name

      t.timestamps
    end
  end
end
