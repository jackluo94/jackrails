json.extract! article, :id, :title, :author, :published_date, :published, :content, :avatarurl, :created_at, :updated_at
json.url article_url(article, format: :json)
