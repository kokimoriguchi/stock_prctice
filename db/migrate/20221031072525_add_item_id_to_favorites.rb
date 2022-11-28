class AddItemIdToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_reference :favorites, :item, foreign_key: true
  end
end
