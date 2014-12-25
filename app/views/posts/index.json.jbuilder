json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :content, :is_restricted
  json.url post_url(post, format: :json)
end
