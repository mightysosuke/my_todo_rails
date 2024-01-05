class V1::AuthorizationsController < V1::ApplicationController
  before_action :authenticate_request!
end
