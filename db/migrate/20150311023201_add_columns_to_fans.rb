class AddColumnsToFans < ActiveRecord::Migration
  def change
    add_column :fans, :username, :string
    add_column :fans, :lastname, :string
    add_column :fans, :birthdate, :datetime
    add_column :fans, :gendre, :strings
    add_column :fans, :town, :string
  end
end
