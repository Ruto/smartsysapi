json.data do
  json.user_profile do
    json.call(
      @user_profile,
      :id,
      :first_name,
      :last_name,
      :middle_name,
      :dob

    )
  end
end
