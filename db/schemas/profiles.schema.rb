create_table :profiles, id: :string, force: :cascade, charset: 'utf8mb4', options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
  t.belongs_to :user,       null: false, foreign_key: true, type: "VARCHAR(255)", comment: "ユーザーID"
  t.string     :nickname,   null: false,                                          comment: "ニックネーム"
  t.string     :email,      null: false,                                          comment: "メールアドレス"
  t.datetime   :created_at, null: false,                                          comment: "作成日時"
  t.datetime   :updated_at, null: false,                                          comment: "更新日時"
end

add_foreign_key "profiles", "users", name: "profile_ibfk_1"
