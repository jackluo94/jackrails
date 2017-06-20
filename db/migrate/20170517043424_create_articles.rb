class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.datetime :published_date
      t.boolean :published
      t.text :content
      t.string :avatarurl

      t.timestamps
    end
  end
end
