class V1::ApplicationController < ApplicationController
  include Secured

  rescue_from StandardError, with: :error500
  rescue_from ActiveRecord::RecordNotFound, with: :error404
  rescue_from ActionController::ParameterMissing, with: :error400
  rescue_from ActionController::RoutingError, with: :error404
  rescue_from ActionController::MethodNotAllowed, with: :error403
  rescue_from ActiveRecord::RecordInvalid, with: :error422

  ERRORS = {
    '400': { message: '不正なリクエストです', status: :bad_request },
    '403': { message: 'アクセスが拒否されました', status: :forbidden },
    '404': { message: 'リソースが見つかりませんでした', status: :not_found },
    '422': { message: 'リクエストは適切ですが、意味的なエラーにより処理できませんでした', status: :unprocessable_entity },
    '500': { message: 'サーバーエラーが発生しました', status: :internal_server_error },
  }.freeze

  def handle_error(error, key)
    error_info = ERRORS[key.to_sym]
    render json: { message: error_info[:message], detail: error.message }, status: error_info[:status]
  end

  def error400(error)
    handle_error(error, '400')
  end

  def error403(error)
    handle_error(error, '403')
  end

  def error404(error)
    handle_error(error, '404')
  end

  def error422(error)
    handle_error(error, '422')
  end

  def error500(error)
    handle_error(error, '500')
  end
end
