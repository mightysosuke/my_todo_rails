class UserMeResource
  include Alba::Resource

  attributes :nickname, :email, :icon

  def icon(profile)
    url_for(profile.icon)
  end
end
