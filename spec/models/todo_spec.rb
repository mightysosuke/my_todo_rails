# == Schema Information
#
# Table name: todos
#
#  id                   :string(255)      not null, primary key
#  content(内容)        :string(255)      not null
#  title(タイトル)      :string(255)      not null
#  created_at(作成日時) :datetime         not null
#  updated_at(更新日時) :datetime         not null
#  user_id(ユーザーID)  :string(255)      not null
#
# Indexes
#
#  index_todos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe "validation" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "association" do
    it { is_expected.to belong_to(:user) }
  end
end
