class AddFanIdToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :fan_id, :integer
  end
end
