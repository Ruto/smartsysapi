class V1::SessionsController < ApplicationController
  def show
    current_user ? head(:ok) : head(:unauthorized)
  end

  def create
    if params[:login_type] != nil and params[:login_type] == "Username"
       @user = User.where(email: params[:username]).first
    elsif params[:login_type] != nil and params[:login_type] == "Email"
       @user = User.where(email: params[:email]).first
    elsif params[:login_type] != nil and params[:login_type] == "Phone"
       @user = User.where(email: params[:phone]).first
    else
      @user = User.where(email: params[:email]).first
    end

    if @user&.valid_password?(params[:password])
      jwt = WebToken.encode(@user)
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

   private

   def session_params
     params.permit(:username, :phone, :email, :password)
   end


 end
