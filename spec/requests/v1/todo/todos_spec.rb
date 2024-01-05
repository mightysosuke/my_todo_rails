require 'rails_helper'

RSpec.describe "V1::Todo::Todos", type: :request do
  # ログイン済みのユーザ
  let(:user) { create(:user) }
  let!(:todos) { create_list(:todo, 3, user: user) }

  # ログインしていないユーザ
  let(:other_user) { create(:user) }
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
end
