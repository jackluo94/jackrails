class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.string :avatar_url
      t.integer :rating
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
