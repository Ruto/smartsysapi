json.data do
  json.array! user_profiles do |user|
    json.partial! 'v1/user_profiles/user_profile', user: user
    
  end
end


#json.array! @articles do |article|
#  json.id article.id
#  json.title article.title
#  json.url article.url
#  json.created_at article.created_at
#end
