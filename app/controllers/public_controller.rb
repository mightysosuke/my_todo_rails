# TODO: 後で消す
class PublicController < ApplicationController
  # This route doesn't need authentication
  def public
    render json: { message: "Hello from a public endpoint! You don't need to be authenticated to see this." }
  end
end
