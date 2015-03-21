class RemoveEmailFromFans < ActiveRecord::Migration
  def change
    remove_column :fans, :email, :string
  end
end
