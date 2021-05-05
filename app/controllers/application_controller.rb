class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  JWT_SECRET_KEY = Rails.application.secrets.secret_key_base
  JWT_ALGORITH = 'HS512'

  before_action :authenticate!

  def authenticate!
    # binding.pry
    authenticate_or_request_with_http_token do |token, options|
      payload = decode_token(token)
      @current_user = User.find payload['id']
    end

  rescue JWT::ExpiredSignature
    data = {
      status: 'expired_token',
      message: 'Expired token'
    }

    render json: data, status: :unauthorized and return
  rescue JWT::ImmatureSignature, JWT::DecodeError
    data = {
      status: 'invalid_token',
      message: 'Invalid Token from Immature Signature'
    }

    render json: data, status: :unauthorized and return
  end

  def current_user
    @current_user
  end

  def encode_token(payload, exp = 2.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRET_KEY, JWT_ALGORITH)
  end
  
  def decode_token(token)
    JWT.decode(token, JWT_SECRET_KEY, true, algorithm: JWT_ALGORITH).first
  end

end