class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :title
      t.text :content
      t.integer :points
      t.string :take_mission
      t.integer :begin_date
      t.integer :final_date

      t.timestamps null: false
    end
  end
end
