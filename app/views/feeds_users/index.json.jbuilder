json.array!(@feeds_users) do |feeds_user|
  json.extract! feeds_user, :id
  json.url feeds_user_url(feeds_user, format: :json)
end
