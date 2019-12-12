json.data do
  json.user do
    json.call(
      @user,
      :email,
      :username
    )
  end
#  json.token token
end
