class RemoveArtistIdFromFan < ActiveRecord::Migration
  def change
    remove_column :fans, :artist_id, :integer
  end
end
