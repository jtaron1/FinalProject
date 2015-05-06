json.array!(@twitter_users) do |twitter_user|
  json.extract! twitter_user, :id, :user_id, :twitter_id
  json.url twitter_user_url(twitter_user, format: :json)
end
