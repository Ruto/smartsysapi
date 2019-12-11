module V1
  class RegistrationController < ApplicationController
    def create
      @user = User.new(user_params)

      if @user.save
        render :create
      else
        head(:unprocessable_entity)
      end
    end

    private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
  end
end
