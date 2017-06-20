class AddNewsletterToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :send_newsletter, :boolean, :default => false
  end
end
