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
class Profile < ApplicationRecord
  include UlidPk
  validates :nickname, presence: true
  validates :email, presence: true
  validates :icon, presence: true

  belongs_to :user
  has_one_attached :icon
end
