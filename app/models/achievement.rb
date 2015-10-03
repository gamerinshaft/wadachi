class Achievement < ActiveRecord::Base
  belongs_to :user

  class << self
    def create(user)

    end

    def update(user)
      language_column_count(user)
    end

    private

    def language_column_count(user) #言語の記述数で評価
      user.github.languages.each do |lang|
        name = "#{lang.name}コミッター初級"
        params = {name: name, content: "#{lang.name}について100行以上記述する"}
        params[:status] = lang.count >=100 ?  1 : 0
        create_or_update(user, name, params)

        name = "#{lang.name}コミッター中級"
        params = {name: name, content: "#{lang.name}について1000行以上記述する"}
        params[:status] = lang.count >=1000 ?  1 : 0
        create_or_update(user, name, params)

        name = "#{lang.name}コミッター上級"
        params = {name: name, content: "#{lang.name}について10000行以上記述する"}
        params[:status] = lang.count >=10000 ?  1 : 0
        create_or_update(user, name, params)
      end
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
