class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.text :name
      t.text :address
      t.string :tel

      t.timestamps
    end
  end
end
