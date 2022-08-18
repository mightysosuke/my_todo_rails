# == Schema Information
#
# Table name: users
#
#  id                   :string(255)      not null, primary key
#  auth0_uid(Auth0ID)   :string(255)      not null
#  created_at(作成日時) :datetime         not null
#  updated_at(更新日時) :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    it { is_expected.to validate_presence_of(:auth0_uid) }
  end

  describe "association" do
    it { is_expected.to have_one(:profile).dependent(:destroy) }
  end
end
