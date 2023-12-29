class UserMeResource < ApplicationResource
  attributes :nickname, :email, :icon

  # albaでのurl_forの使い方(development.rbのhostの設定)
  attribute :icon do |resource|
    url_for(resource.icon)
  end
end
