module AuthorizationHelper
  def authorization_stub
    allow_any_instance_of(V1::Users::AuthorizationsController).to receive(:authenticate_request!).and_return(user)
    allow_any_instance_of(V1::Users::AuthorizationsController).to receive(:current_user).and_return(user)
  end
end
