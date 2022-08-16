module Secured
  extend ActiveSupport::Concern

  # included do
  #   before_action :authenticate_request!
  # end

  def current_user
    @user
  end

  private

  def authenticate_request!
    @auth_payload, @auth_header = auth_token
    @user = User.find_by!(auth0_uid: @auth_payload['sub'])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { message: :unauthorized }, status: :unauthorized
  end

  def auth_payload
    @auth_payload, @auth_header = auth_token
    @auth_payload
  end

  def http_token
    request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
  end

  def auth_token
    JsonWebToken.verify(http_token)
  end
end
