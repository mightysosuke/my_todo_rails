require 'rails_helper'

RSpec.describe "V1::Todo::Todos", type: :request do
  # ログイン済みのユーザ
  let!(:user) { create(:user) }
  let!(:todos) { create_list(:todo, 3, user: user) }

  # ログインしていないユーザ
  let!(:other_user) { create(:user) }
  let!(:other_todos) { create_list(:todo, 2, user: other_user) }

  let!(:headers) { { "Content-Type" => "application/json" } }

  describe "GET /v1/todos" do
    context "ログイン済みのユーザの場合" do
      before do
        authorization_stub
        get v1_todos_path, headers: headers
      end

      it "ステータスコードが200であること" do
        expect(response).to have_http_status(200)
      end

      it "ログイン済みのユーザのtodosのみがJSON形式で返されること" do
        json = JSON.parse(response.body)
        expect(json.length).to eq(3)
        expect(json.map { |todo| todo["title"] }).to match_array(todos.map(&:title))
      end
    end

    context "ログインしていないユーザの場合" do
      before do
        get v1_todos_path, headers: headers
      end

      it "ステータスコードが401であること" do
        expect(response).to have_http_status(401)
      end

      it "エラーメッセージがJSON形式で返されること" do
        json = JSON.parse(response.body)
        expect(json["message"]).to eq("Unauthorized")
      end
    end
  end

  describe "GET /v1/todo/todos/:id" do
    let!(:todo) { todos.first }

    context "ログイン済みのユーザの場合" do
      before do
        authorization_stub
        get v1_todo_path(todo.id), headers: headers
      end

      it "ステータスコードが200であること" do
        expect(response).to have_http_status(200)
      end

      it "指定したtodoがJSON形式で返されること" do
        json = JSON.parse(response.body)
        expect(json['id']).to eq(todo.id)
        expect(json['title']).to eq(todo.title)
        expect(json['content']).to eq(todo.content)
      end
    end

    context "ログインしていないユーザの場合" do
      before do
        get v1_todo_path(todo.id), headers: headers
      end

      it "ステータスコードが401であること" do
        expect(response).to have_http_status(401)
      end

      it "エラーメッセージがJSON形式で返されること" do
        json = JSON.parse(response.body)
        expect(json["message"]).to eq("Unauthorized")
      end
    end
  end

  describe "POST /v1/todos" do
    let!(:valid_attributes) { attributes_for(:todo) }

    context "ログイン済みのユーザの場合" do
      before do
        authorization_stub
        post v1_todos_path, params: { todo: valid_attributes }.to_json, headers: headers
      end
      it "ステータスコードが201であること" do
        expect(response).to have_http_status(201)
      end

      it "新しいtodoが作成されること" do
        expect(user.todos.count).to eq(4)
        expect(user.todos.last.title).to eq(valid_attributes[:title])
        expect(user.todos.last.content).to eq(valid_attributes[:content])
      end
    end

    context "ログインしていないユーザの場合" do
      before do
        post v1_todos_path, params: { todo: valid_attributes }.to_json, headers: headers
      end

      it "ステータスコードが401であること" do
        expect(response).to have_http_status(401)
      end

      it "エラーメッセージがJSON形式で返されること" do
        json = JSON.parse(response.body)
        expect(json["message"]).to eq("Unauthorized")
      end
    end
  end

  describe "DELETE /v1/todo/todos/:id" do
    let!(:todo) { todos.first }

    context "ログイン済みのユーザの場合" do
      before do
        authorization_stub
        delete v1_todo_path(todo.id), headers: headers
      end

      it "ステータスコードが204であること" do
        expect(response).to have_http_status(204)
      end

      it "指定したtodoが削除されること" do
        expect { Todo.find(todo.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "ログインしていないユーザの場合" do
      before do
        delete v1_todo_path(todo.id), headers: headers
      end

      it "ステータスコードが401であること" do
        expect(response).to have_http_status(401)
      end

      it "エラーメッセージがJSON形式で返されること" do
        json = JSON.parse(response.body)
        expect(json["message"]).to eq("Unauthorized")
      end
    end
  end
end
