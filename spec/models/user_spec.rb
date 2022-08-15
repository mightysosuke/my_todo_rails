# == Schema Information
#
# Table name: users
#
#  id         :string(255)      not null, primary key
#  auth0_uid  :string(255)      not null
#  updated_at :datetime         not null
#  created_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
