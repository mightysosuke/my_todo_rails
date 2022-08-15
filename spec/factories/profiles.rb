# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  nickname   :string(255)      not null
#  icon       :string(255)
#  updated_at :datetime         not null
#  created_at :datetime         not null
#
FactoryBot.define do
  factory :profile do
    
  end
end
