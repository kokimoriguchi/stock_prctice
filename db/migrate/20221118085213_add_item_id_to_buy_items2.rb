class AddItemIdToBuyItems2 < ActiveRecord::Migration[7.0]
  def change
    add_reference :buy_items, :item, foreign_key: true
  end
end
