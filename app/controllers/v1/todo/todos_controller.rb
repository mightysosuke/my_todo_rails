class V1::Todo::TodosController < V1::AuthorizationsController
  def index
    render json: TodosResource.new(current_user.todos.order(:id)).serialize
  end
end
