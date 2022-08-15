# == Schema Information
#
# Table name: profiles
#
#  id         :string(255)      not null, primary key
#  user_id    :string(255)      not null
#  nickname   :string(255)      not null
#  email      :string(255)      not null
#  icon       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
