json.extract! blog, :id, :title, :published_date, :author, :content, :created_at, :updated_at
json.url blog_url(blog, format: :json)
