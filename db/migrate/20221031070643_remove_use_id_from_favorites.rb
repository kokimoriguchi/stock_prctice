class RemoveUseIdFromFavorites < ActiveRecord::Migration[7.0]
  def change
    remove_column :favorites, :use_id, :integer
  end
end
