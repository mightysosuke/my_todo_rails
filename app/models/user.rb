# == Schema Information
#
# Table name: users
#
#  id         :string(255)      not null, primary key
#  auth0_uid  :string(255)      not null
#  updated_at :datetime         not null
#  created_at :datetime         not null
#
class User < ApplicationRecord
  include UlidPk
  validates :auth0_uid, presence: :true

  has_one :profile, dependent: :destroy
end
