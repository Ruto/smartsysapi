json.user do
    json.call(
      @user,
      :email,
      :username
    )
  json.token token
end
