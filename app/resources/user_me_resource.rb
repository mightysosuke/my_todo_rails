class UserMeResource < ApplicationResource
  attributes :nickname, :email, :icon

  attribute :icon do |resource|
    url_for(resource.icon)
  end
end
