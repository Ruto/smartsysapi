require 'test_helper'

class UserProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_profile = user_profiles(:one)
  end

  test "should get index" do
    get user_profiles_url, as: :json
    assert_response :success
  end

  test "should create user_profile" do
    assert_difference('UserProfile.count') do
      post user_profiles_url, params: { user_profile: { dob: @user_profile.dob, first_name: @user_profile.first_name, last_name: @user_profile.last_name, middle_name: @user_profile.middle_name, photo: @user_profile.photo } }, as: :json
    end

    assert_response 201
  end

  test "should show user_profile" do
    get user_profile_url(@user_profile), as: :json
    assert_response :success
  end

  test "should update user_profile" do
    patch user_profile_url(@user_profile), params: { user_profile: { dob: @user_profile.dob, first_name: @user_profile.first_name, last_name: @user_profile.last_name, middle_name: @user_profile.middle_name, photo: @user_profile.photo } }, as: :json
    assert_response 200
  end

  test "should destroy user_profile" do
    assert_difference('UserProfile.count', -1) do
      delete user_profile_url(@user_profile), as: :json
    end

    assert_response 204
  end
end
