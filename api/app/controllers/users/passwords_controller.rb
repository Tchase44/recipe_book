# frozen_string_literal: true
# todo: see if devise interferes with these routes as well
class Users::PasswordsController < Devise::PasswordsController
  before_action :authenticate_request! # <- protected routes
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    # super
    if params[:user][:id] == current_user.id && params[:user][:username] == current_user.username
      
    else
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
