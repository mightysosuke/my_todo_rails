# == Schema Information
#
# Table name: profiles
#
#  id                     :string(255)      not null, primary key
#  email(メールアドレス)  :string(255)      not null
#  nickname(ニックネーム) :string(255)      not null
#  created_at(作成日時)   :datetime         not null
#  updated_at(更新日時)   :datetime         not null
#  user_id(ユーザーID)    :string(255)      not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...    (user_id => users.id)
#  profile_ibfk_1  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "validation" do
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:icon) }
  end

  describe "association" do
    it { is_expected.to belong_to(:user) }
  end
end
