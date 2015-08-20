class UserController < ApplicationController
  def index
    @user = current_user
    @client = Octokit::Client.new access_token: @user.github_token
    @hoge = @client.user
  end
end
