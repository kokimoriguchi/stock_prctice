class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :product_name
      t.text :arrival_source
      t.text :manufactuer
      t.integer :price

      t.timestamps
    end
  end
end
