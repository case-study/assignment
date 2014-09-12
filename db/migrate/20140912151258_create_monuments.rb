class CreateMonuments < ActiveRecord::Migration
  def change
    create_table :monuments do |t|
      t.string :name
      t.string :description
      t.integer :collection_id

      t.timestamps
    end
  end
end
