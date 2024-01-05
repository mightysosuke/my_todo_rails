require 'rails_helper'

RSpec.describe V1::Users::MesController, type: :request do
let!(:user) { create(:user) }
    let!(:profile) { create(:profile, user: user) }
    let!(:headers) { { "Content-Type" => "application/json" } }
    let!(:res) do
      {
        nickname: profile.nickname,
        email: profile.email,
        icon: url_for(profile.icon),
      }.as_json
    end

  describe "GET /v1/users/me" do
    context "ログイン済みのユーザの場合" do
      before do
        authorization_stub
        get v1_users_me_path, headers: headers
      end

      it "ステータスコードが200であること" do
        expect(response).to have_http_status(200)
      end

      it "ログイン済みのユーザのプロフィールがJSON形式で返されること" do
        json = JSON.parse(response.body)
        expect(json).to eq(res)
      end
    end

    context "ログインしていないユーザの場合" do
      before do
        get v1_users_me_path, headers: headers
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
