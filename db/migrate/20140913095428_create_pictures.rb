class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.text :description
      t.date :taken_on
      t.integer :monument_id

      t.timestamps
    end
  end
end
