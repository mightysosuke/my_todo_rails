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
class Profile < ApplicationRecord
  include UlidPk

  has_one_attached :icon

  validates :nickname, presence: true
  validates :email, presence: true
  validates :icon, presence: true

  belongs_to :user
end
