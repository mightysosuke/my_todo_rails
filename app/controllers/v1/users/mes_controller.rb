class V1::Users::MesController < V1::Users::AuthorizationsController
  include Alba::Resource

  def show
    current_user.serialize
  end
end
