class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    Rails.logger.debug("---------\n#{request.env["omniauth.auth"][:credentials][:token]}\n-----------")
    @user = User.find_or_create_by(user_params)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  private
  def user_params
    params = request.env["omniauth.auth"].slice(:provider, :uid).to_h
    params["github_token"] = request.env["omniauth.auth"][:credentials][:token]
    params.to_h
  end
end