class V1::Todo::TodosController < V1::AuthorizationsController
  def index
    render json: Todo::TodoResource.new(current_user.todos.order(:id)).serialize
  end

  def show
    render json: Todo::TodoResource.new(current_user.todos.find(params[:id])).serialize
  end

  def create
    new_todo = current_user.todos.build(todo_params)
    new_todo.save!
    head :created
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :content)
  end
end
