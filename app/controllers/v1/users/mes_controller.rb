class V1::Users::MesController < V1::Users::AuthorizationsController
  def show
    render json: UserMeResource.new(current_user.profile).serialize
  end
end
