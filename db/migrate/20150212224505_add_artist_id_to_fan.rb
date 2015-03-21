class AddArtistIdToFan < ActiveRecord::Migration
  def change
    add_column :fans, :artist_id, :integer
  end
end
