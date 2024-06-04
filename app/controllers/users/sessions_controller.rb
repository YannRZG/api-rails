class Users::SessionsController < Devise::SessionsController
  respond_to :json
  
  def respond_with(resource, options = {})
    render json: {
      status: { code: 200, message: "Signed in successfully", data: current_user }
    }, status: :ok
  end

  def destroy
    super
  end

  def respond_to_on_destroy
    jwt_token = request.headers["Authorization"].split(" ").last
    decoded_token = JWT.decode(jwt_token, Rails.application.credentials.fetch(:secret_key_base)).first
    debugger
    current_user = User.find(decoded_token["sub"])
    if current_user
      render json: {
        status: 200,
        message: "Signed out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
