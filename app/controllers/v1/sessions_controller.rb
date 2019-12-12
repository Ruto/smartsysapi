
 class V1::SessionsController < ApplicationController
  def show
    current_user ? head(:ok) : head(:unauthorized)
  end

  def create
    @user = User.where(email: params[:email]).first

    if @user&.valid_password?(params[:password])
      user = @user
      jwt = WebToken.encode(user)
       #binding.pry
      render :create, status: :created, locals: { token: jwt }
      #render json: @user.as_json(only: [:id, :email, :username]), status: :created

    else
      render json: { error: 'invalid_credentials' }, status: :unauthorized
    end
  end

  def destroy
    current_user&.authentication_token = nil
    if current_user&.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end
 end
