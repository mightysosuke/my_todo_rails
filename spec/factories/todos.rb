# == Schema Information
#
# Table name: todos
#
#  id                   :string(255)      not null, primary key
#  content(内容)        :text(65535)      not null
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
FactoryBot.define do
  factory :todo do
    title {  }
    content {  }
  end
end
