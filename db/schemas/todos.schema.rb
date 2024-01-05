create_table :todos, id: :string, force: :cascade, charset: 'utf8mb4', options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
  t.belongs_to :user,       null: false, foreign_key: true, type: :string, comment: "ユーザーID"
  t.string   :title,        null: false,                                   comment: "タイトル"
  t.text     :content,      null: false,                                   comment: "内容"
  t.datetime :updated_at,   null: false,                                   comment: "更新日時"
  t.datetime :created_at,   null: false,                                   comment: "作成日時"
end
