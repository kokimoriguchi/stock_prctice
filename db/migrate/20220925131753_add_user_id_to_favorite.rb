class AddUserIdToFavorite < ActiveRecord::Migration[7.0]
  def change
    add_column :favorites, :user_id, :integer
  end
end
