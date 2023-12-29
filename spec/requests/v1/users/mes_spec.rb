require 'rails_helper'

RSpec.describe V1::Users::MesController, type: :request do
  describe "GET /v1/users/me" do
    let!(:user) { create(:user) }
    let!(:profile) { create(:profile, user: user) }
    let!(:headers) { { "Content-Type" => "application/json" } }
    let!(:res) do
      {
        nickname: profile.nickname,
        email: profile.email,
        icon: url_for(profile.icon)
    }.as_json
    end

    before do
      allow_any_instance_of(V1::Users::AuthorizationsController).to receive(:authenticate_request!).and_return(user)
      allow_any_instance_of(V1::Users::AuthorizationsController).to receive(:current_user).and_return(user)
    end
    it "正常にレスポンスが返ってくること" do
      get v1_users_me_path, headers: headers
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(res)
    end
  end
end
