class ApplicationController < ActionController::API
  private

  def unauthorized
    render(json: { message: :Unauthorized }, status: :unauthorized)
  end
end
