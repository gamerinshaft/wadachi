class DashboardController < ApplicationController
  def index
    @client = Octokit::Client.new access_token: current_user.github_token
    @hoge = @client
    @user = @client.user
  end
end
