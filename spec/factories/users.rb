# == Schema Information
#
# Table name: users
#
#  id         :string(255)      not null, primary key
#  auth0_uid  :string(255)      not null
#  updated_at :datetime         not null
#  created_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    
  end
end
