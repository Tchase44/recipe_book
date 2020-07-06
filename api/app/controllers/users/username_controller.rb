# Devise is messing with my API routes so im creating smaller custom controllers and routes
class Users::UsernameController < ApplicationController
  respond_to :json
  before_action :authenticate_request! # <- protected routes

  def show
    u = current_user
    render json: {username: u.username}
  end

  def update
    u = User.find(params["account_update"]["id"])
    if u.id == current_user.id && u.username == current_user.username
      u.username = params["account_update"]["username"]
      if u.save
        render json: { username: u.username, message: "Change Successful"}
      else
        render json: {errors: user.errors.full_messages}
      end
    else
      render json: {errors: "Unautorized"}
    end
  end

  def available
    x = User.find_by(username: params[:username]).select(:username)
    render json: {username: "Finding available usernames"}
  end

  private

  def ingredient_params
    params.require(:account_update).permit(:id, :usernamename)
  end
end