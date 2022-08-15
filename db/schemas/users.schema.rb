create_table :users, id: :string, force: :cascade, charset: 'utf8mb4', options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
  t.string   :auth0_uid,  null: false, comment: "Auth0ID"
  t.datetime :updated_at, null: false, comment: "更新日時"
  t.datetime :created_at, null: false, comment: "作成日時"
end
