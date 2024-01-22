require 'rails_helper'

RSpec.describe User::UserMeResource, type: :resource do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  subject { described_class.new(profile) }

  describe "Resourceを使用した場合" do
    context "正常なオブジェクトを作成した場合" do
      it "オブジェクトのプロパティがProfileのプロパティと同じであること" do
        expect(subject.object.nickname).to eq(profile.nickname)
        expect(subject.object.email).to eq(profile.email)
        expect(subject.object.icon).to eq(profile.icon)
      end
    end
  end
end
