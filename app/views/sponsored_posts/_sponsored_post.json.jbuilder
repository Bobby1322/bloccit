json.extract! sponsored_post, :id, :title, :body, :price, :created_at, :updated_at
json.url sponsored_post_url(sponsored_post, format: :json)
