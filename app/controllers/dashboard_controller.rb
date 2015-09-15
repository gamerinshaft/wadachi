class DashboardController < ApplicationController
  def index
    @client = Octokit::Client.new access_token: current_user.github_token
    @user = current_user
    @repos = @client.repositories(current_user.nickname)
    @flag = @user.flag
    filter = %i[name email uid avatar_url]
    @users = User.select(filter).page
  end
end
