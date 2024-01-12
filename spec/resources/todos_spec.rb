require 'rails_helper'

RSpec.describe TodosResource, type: :resource do
  let!(:user) { create(:user) }
  let!(:todo) { create(:todo, user: user) }

  subject { described_class.new(todo) }

  describe "Resourceを使用した場合" do
    context "正常なオブジェクトを作成した場合" do
      it "オブジェクトのプロパティがTodoのプロパティと同じであること" do
        expect(subject.object.title).to eq(todo.title)
        expect(subject.object.content).to eq(todo.content)
      end
    end
  end
end
