# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
respond_to :json

private

def respond_with(resource, options = {})
  if resource.persisted?
    render json: {
      status: {code: 200, message: "Signed up sucessfully", 
      data: resource}
      }, status: :ok
  else
    render json: {
      status: {message: "User couldn't be created.",
      errors: resource.errors.full_messages},
      code: :unprocessable_entity
    }
  end
end
end