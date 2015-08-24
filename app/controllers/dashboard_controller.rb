class DashboardController < ApplicationController
  def index
    @client = Octokit::Client.new access_token: current_user.github_token
    @hoge = @client
    @repos = @client.repositories(current_user.nickname)
    @github = @client.user
    @user = current_user
    Rails.logger.debug("⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎#{current_user}⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎⭐︎");
    @flag = @user.flag
    @users = User.page
  end

end
