class Article < ApplicationRecord
  validates_presence_of :title, :author, :published_date, message: "must be fill in."

  validates :content, length: { minimum: 50, maximum: 5000}

  validates :published, inclusion: { in: [ true, false ] }

  validates_format_of :avatarurl, :with => /https?:\/\/[\S]+/, message: "must be http://- or https://-"

  after_save do | article |
    if article.published?
      #send an email to all users
      User.where( :send_newsletter => true).each do |user|
        # calling the mailer
        UserMailer.sent_article_to_user(article, user).deliver_now
      end
    end
  end

  paginates_per 10

end
