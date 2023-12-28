class V1::Users::MesController < V1::Users::AuthorizationsController
  def show
    current_user = User.first
    render json: UserMeResource.new(current_user.profile).serialize
  end
end
