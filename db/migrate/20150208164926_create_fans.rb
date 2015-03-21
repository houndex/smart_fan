class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :country
      t.string :city

      t.timestamps null: false
    end
  end
end
