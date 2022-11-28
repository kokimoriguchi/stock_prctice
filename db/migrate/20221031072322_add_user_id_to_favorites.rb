class AddUserIdToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_reference :favorites, :user, foreign_key: true
  end
end
