class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.text :bio
      t.string :photo

      t.timestamps null: false
    end
  end
end
