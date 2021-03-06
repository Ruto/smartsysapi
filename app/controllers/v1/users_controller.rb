class V1::UsersController < ApplicationController
    def create
      @user = User.new(user_params)

      if @user.save
        jwt = WebToken.encode(@user)
        render :create, status: :created, locals: { token: jwt }
      else
        head(:unprocessable_entity)
      end
    end

    private

    def user_params
      params.permit(:username, :phone, :email, :password, :password_confirmation)
    end
end
