# == Schema Information
#
# Table name: profiles
#
#  id         :string(255)      not null, primary key
#  user_id    :string(255)      not null
#  nickname   :string(255)      not null
#  email      :string(255)      not null
#  icon       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
