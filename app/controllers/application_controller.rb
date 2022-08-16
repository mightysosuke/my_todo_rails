class ApplicationController < ActionController::API
  private

  def unauthorized
    render(json: { message: :unauthorized }, status: :unauthorized)
  end
end
