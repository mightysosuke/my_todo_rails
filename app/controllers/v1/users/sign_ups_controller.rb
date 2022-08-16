class V1::Users::SignUpsController < V1::Users::ApplicationController
  def create
    if JsonWebToken.verify(http_token)
      ActiveRecord::Base.transaction do
        user = User.find_or_initialize_by(auth0_uid: auth_payload['sub'])
        if user.new_record?
          user.save!
          Profile.create!(
            user: user,
            nickname: sign_up_params[:nickname],
            email: sign_up_params[:email],
            icon: sign_up_params[:icon] || nil,
          )
        end
      end
      head :created
    else
      unauthorized
    end
  end

  private

  def sign_up_params
    pp params
    params.require(:sign_up).permit(:nickname, :email, :icon)
  end
end
