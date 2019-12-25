module V1
class ResetPasswordsController < ApplicationController
   def create
    user = User.find_by_email(user_params)
    if user.present?
     user.send_reset_password_instructions
     render(
          json: "{ \"result\": \"Email already exists\"}",
          status: 201
        )
    else
      render(
          json: "{ \"error\": \"Not found\"}",
          status: 404
        )
    end
  end

  private

  def user_params
    params.require(:email)
  end
end
end
