class RemoveCartsFromUserId < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :User_id
  end
end
