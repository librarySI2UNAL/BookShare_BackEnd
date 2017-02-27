class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :city
      t.decimal :qualification
      t.belongs_to :photo, index: true

      t.timestamps
    end
  end
end
