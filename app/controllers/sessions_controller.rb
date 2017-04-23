class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    @user = User.find_by(username: params[:session][:username])
    if @user.authenticate(params[:session][:password])
      payload = {user_id: @user.id}
      token = Auth.issue(payload)
      render json: {jwt: token}
    else
      render json: {error: "bad username or password"}, status: 401
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end


end
