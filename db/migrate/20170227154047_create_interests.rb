class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.string :name
      t.string :icon_name
      t.belongs_to :photo, index: true

      t.timestamps
    end
  end
end
