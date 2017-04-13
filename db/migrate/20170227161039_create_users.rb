class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.decimal :qualification
      t.decimal :latitude
      t.decimal :longitude
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end
