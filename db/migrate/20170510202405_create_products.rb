class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :qty_on_hand
      t.decimal :price
      t.decimal :cost
      t.decimal :shipping_weight
      t.string :thumbnail
      t.string :full_size

      t.timestamps
    end
  end
end