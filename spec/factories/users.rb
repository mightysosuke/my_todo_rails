# == Schema Information
#
# Table name: users
#
#  id                   :string(255)      not null, primary key
#  auth0_uid(Auth0ID)   :string(255)      not null
#  created_at(作成日時) :datetime         not null
#  updated_at(更新日時) :datetime         not null
#
FactoryBot.define do
  factory :user do
  end
end
