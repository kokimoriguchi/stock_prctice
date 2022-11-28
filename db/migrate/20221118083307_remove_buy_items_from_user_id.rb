class RemoveBuyItemsFromUserId < ActiveRecord::Migration[7.0]
  def change
    remove_column :buy_items, :User_id
  end
end
