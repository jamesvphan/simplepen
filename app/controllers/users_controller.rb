class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
    render json: @users
  end

  def show
    token = params[:headers][:token]
    @result = Auth.decode(token)
    @user = User.find(@result["user_id"])
    @userAccount = {
      notebooks: @user.notebooks,
      id: @user.id,
      username: @user.username,
      email: @user.email
    }
    render json: @userAccount
  end

  def create
    byebug
    @user = User.new(user_params)

    if @user.save
      payload = {user_id: @user.id}
      token = Auth.issue(payload)
      render json: {jwt: token}
    else
      render json: {error: @user.errors}, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
