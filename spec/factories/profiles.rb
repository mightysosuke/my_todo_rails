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
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :profile do
    association :user
    email { Faker::Internet.email }
    nickname { Faker::Internet.username }

    after(:build) do |profile|
      profile.icon.attach(io: File.open('spec/fixtures/icon.png'), filename: 'icon.png', content_type: 'image/png')
    end
  end
end
