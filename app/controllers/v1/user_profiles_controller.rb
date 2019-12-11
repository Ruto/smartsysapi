module V1
class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_profile, only: [:show, :update, :destroy]

  # GET /user_profiles
  def index
    @user_profiles = UserProfile.all
    #a = current_user
    #binding.pry
    render json: @user_profiles
  end

  # GET /user_profiles/1
  def show
    render json: @user_profile
  end

  # POST /user_profiles
  def create
    @user_profile = UserProfile.new(user_profile_params)

    if @user_profile.save
      render :create, status: :created, locals: { user_profile: @user_profile  }
      #render json: @user_profile, status: :created, location: @user_profile
    else
      render json: @user_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_profiles/1
  def update
    if @user_profile.update(user_profile_params)
      render json: @user_profile
    else
      render json: @user_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_profiles/1
  def destroy
    @user_profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_profile_params
      params.permit(:first_name, :middle_name, :last_name, :photo, :dob)
    end
end
end
