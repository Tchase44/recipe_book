# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_request!, only[:update, :destroy] # <- protected routes
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /sign_up
  def create
    user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      username: params[:username] ? params[:username] : params[:email]
    )
    if user.valid?
      if user.save
        auth_token = JsonWebToken.encode({user_id: user.id})
        render json: {auth_token: auth_token, message: "Account Created!"}, status: :ok
      else
        render json: {errors: user.errors.full_messages}
      end
    else
      render json: {errors: user.errors.full_messages}
    end
    # super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /users
  # def update
    # super
  # end

  # DELETE /users
  def destroy
    # super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
