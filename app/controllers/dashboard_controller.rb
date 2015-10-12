class DashboardController < ApplicationController
  def index
    # @client = Octokit::Client.new access_token: current_user.github_token
    @user = current_user
    filter = %i[name nickname uid avatar_url]
    @users = User.select(filter)

    hash = Hash.new{|h,k| h[k]= []}
    @pass_islands = Hash.new{|h,k| h[k]= []}
    current_user.pass_areas.each do |area|
      hash[:islands].push area.island
    end

    @data = {}
    hash[:islands].uniq!
    hash[:islands].each do |island|
      areas = current_user.pass_areas.where(island_id: island.id)
      island = JSON.parse(island.to_json).compact
      island[:areas] = JSON.parse(areas.to_json).compact
      @pass_islands[:islands].push island
    end

    @languages = {}
    User.all.each do |user|
      user.github.languages.each do |lang|
        @languages[lang.name.to_sym] ||= 0
        @languages[lang.name.to_sym] += lang.count
      end
    end
    @languages = @languages.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
    @languages = @languages.to_a

    @flag = @user.flag
  end

end



