json.extract! comment, :id, :author, :content, :avatar_url, :rating, :blog_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
