# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  auth0_uid  :string(255)      not null
#  updated_at :datetime         not null
#  created_at :datetime         not null
#
class User < ApplicationRecord
end
