class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.find_or_initialize_by(uid)
    if @user.new_record?
      @user.save
      @user.update_attributes(user_params)
      @user.profile = Profile.new()
      @user.flag = Flag.new()
      @user.github = Github.new(token)
      @user.notification = Notification.new()
      @user.save
      @client = Octokit::Client.new access_token: @user.github_token
      @repos = @client.repositories(@user.nickname)
      @languages = {}
      @repos.each do |repo|
        @user.github.repositories.create(name: repo.name, private: repo.private, svn_url: repo.svn_url, size: repo.size, description: repo.description)
        @client.languages(repo.full_name).each do |lang, count|
          if(@languages.key?(lang.to_sym))
            @languages[lang.to_sym] += count
          else
            @languages[lang.to_sym] = count
          end
        end
      end
      params = @languages.map{|lang, count| {name: lang, count: count}}
      @user.github.languages.create(params)
      Island.update()
      Achievement.update(@user)
      Pass.update(@user)
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
  def token
    params = request.env["omniauth.auth"][:credentials].slice(:token).to_h
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