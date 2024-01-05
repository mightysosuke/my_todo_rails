require 'rails_helper'

RSpec.describe "V1::Todo::Todos", type: :request do
  # ログイン済みのユーザ
  let(:user) { create(:user) }
  let!(:todos) { create_list(:todo, 3, user: user) }

  # ログインしていないユーザ
  let(:other_user) { create(:user) }
  let!(:other_todos) { create_list(:todo, 2, user: other_user) }

  let!(:headers) { { "Content-Type" => "application/json" } }

  # GET /v1/todos のテスト
  describe "GET /v1/todos" do
    # ログイン済みのユーザの場合
    context "ログイン済みのユーザの場合" do
      before do
        authorization_stub
        get v1_todos_path, headers: headers
      end

      # ステータスコードが200であること
      it "ステータスコードが200であること" do
        expect(response).to have_http_status(200)
      end

      # ログイン済みのユーザのtodosのみがJSON形式で返されること
      it "ログイン済みのユーザのtodosのみがJSON形式で返されること" do
        json = JSON.parse(response.body)

        # todosの数が3であること
        expect(json.length).to eq(3)

        # todosのtitleがログイン済みのユーザのtodosのtitleと一致すること
        expect(json.map { |todo| todo["title"] }).to match_array(todos.map(&:title))
      end
    end

    # ログインしていないユーザの場合
    context "ログインしていないユーザの場合" do
      before do
        get v1_todos_path, headers: headers
      end

      it "ステータスコードが401であること" do
        expect(response).to have_http_status(401)
      end

      it "エラーメッセージがJSON形式で返されること" do
        json = JSON.parse(response.body)

        # エラーメッセージが"Unauthorized"であること
        expect(json["message"]).to eq("Unauthorized")
      end
    end
  end
end
