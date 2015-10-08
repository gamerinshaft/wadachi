class Achievement < ActiveRecord::Base
  belongs_to :user

  class << self
    def create(user)

    end

    def update(user)
      language_column_count(user)
      repository_create_count(user)
    end

    private

    def language_column_count(user) #言語の記述数で評価
      user.github.languages.each do |lang|
        name = "#{lang.name}コミッター初級"
        params = {name: name, content: "#{lang.name}について100行以上記述する"}
        params[:status] = lang.count >=100 ?  1 : 0
        params[:percentage] = lang.count >=100 ? 100 : ((lang.count/100.to_f)*100).to_i
        create_or_update(user, name, params)

        name = "#{lang.name}コミッター中級"
        params = {name: name, content: "#{lang.name}について1000行以上記述する"}
        params[:status] = lang.count >=1000 ?  1 : 0
        params[:percentage] = lang.count >=1000 ? 100 : ((lang.count/1000.to_f)*100).to_i
        create_or_update(user, name, params)

        name = "#{lang.name}コミッター上級"
        params = {name: name, content: "#{lang.name}について10000行以上記述する"}
        params[:status] = lang.count >=10000 ?  1 : 0
        params[:percentage] = lang.count >=10000 ? 100 : ((lang.count/10000.to_f)*100).to_i
        create_or_update(user, name, params)
      end
    end

    def repository_create_count(user) #リポジトリを作った数
      name = "プロジェクトメイカー初級"
      params = {name: name, content: "リポジトリを一つ作る"}
      params[:status] = user.github.repositories.count >=1 ?  1 : 0
      params[:percentage] = user.github.repositories.count >=1 ? 100 : ((user.github.repositories.count/1.to_f)*100).to_i
      create_or_update(user, name, params)

      name = "プロジェクトメイカー中級"
      params = {name: name, content: "リポジトリを五つ作る"}
      params[:status] = user.github.repositories.count >=5 ?  1 : 0
      params[:percentage] = user.github.repositories.count >=5 ? 100 : ((user.github.repositories.count/5.to_f)*100).to_i
      create_or_update(user, name, params)

      name = "プロジェクトメイカー上級"
      params = {name: name, content: "リポジトリを十個作る"}
      params[:status] = user.github.repositories.count >=10 ?  1 : 0
      params[:percentage] = user.github.repositories.count >=10 ? 100 : ((user.github.repositories.count/10.to_f)*100).to_i
      create_or_update(user, name, params)
    end

    def create_or_update(user, key, params)
      if user.achievements.exists?(name: key)
        user.achievements.find_by(name: key).update(params)
      else
        user.achievements.create(params)
      end
    end
  end
end
