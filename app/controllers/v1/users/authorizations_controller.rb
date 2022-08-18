class V1::Users::AuthorizationsController < V1::Users::ApplicationController
  before_action :authenticate_request!
end
