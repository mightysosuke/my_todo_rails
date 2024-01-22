class V1::Users::MesController < V1::AuthorizationsController
  def show
    render json: User::UserMeResource.new(current_user.profile).serialize
  end
end
