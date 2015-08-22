class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    Rails.logger.debug("-----------------\n#{request.env["omniauth.auth"]}\n------------------")
    @user = User.find_or_create_by(user_params)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      @user.profile = Profile.new()
      session["devise.github_data"] = request.env["omniauth.auth"]
      sign_in_and_redirect @user, :event => :authentication
    end
  end

  private
  def user_params
    params = request.env["omniauth.auth"].slice(:provider, :uid).to_h
    params["github_token"] = request.env["omniauth.auth"][:credentials][:token]
    params["email"] = request.env["omniauth.auth"][:info][:email]
    params["avatar_url"] = request.env["omniauth.auth"][:info][:image]
    params["name"] = request.env["omniauth.auth"][:info][:name]
    params["nickname"] = request.env["omniauth.auth"][:info][:nickname]
    params.to_h
  end
end