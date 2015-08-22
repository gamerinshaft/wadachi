class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    Rails.logger.debug("-----------------\n#{uid}\n------------------")
    @user = User.find_or_initialize_by(uid)
    if @user.new_record?
      @user.update_attributes(user_params)
      @user.profile = Profile.new()
      @user.flag = Flag.new()
      @user.notification = Notification.new()
      @user.save
      session["devise.github_data"] = request.env["omniauth.auth"]
      sign_in_and_redirect @user, :event => :authentication
    else
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    end
  end

  private
  def uid
    params = request.env["omniauth.auth"].slice(:uid).to_h
  end
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