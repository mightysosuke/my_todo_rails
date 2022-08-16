class ApplicationController < ActionController::API
  private

  def
    render(json: { message: :unauthorized }, status: :unauthorized)
  end
end
