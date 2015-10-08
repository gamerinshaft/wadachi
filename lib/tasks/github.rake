namespace :github do
  desc "githubの情報を更新"

  task :update => :environment do
    User.all.each do |user|
      logger = Logger.new('log/github.log')
      logger.info "------------------------------------------------------"
      logger.info "#{Time.now} -- starting_task -- #{user.to_yaml}"
      client = Octokit::Client.new access_token: user.github_token
      repos = client.repositories(user.nickname)
      languages = {}
      repos.each do |repo|
        if user.github.repositories.exists?(name: repo.name)
          user.github.repositories.find_by(name: repo.name).update(name: repo.name, private: repo.private, svn_url: repo.svn_url, size: repo.size, description: repo.description)
        else
          user.github.repositories.create(name: repo.name, private: repo.private, svn_url: repo.svn_url, size: repo.size, description: repo.description)
        end
        client.languages(repo.full_name).each do |lang, count|
          if languages.key?(lang.to_sym)
            languages[lang.to_sym] += count
          else
            languages[lang.to_sym] = count
          end
        end
      end
      languages.each do |lang, count|
        if user.github.languages.exists?(name: lang)
          user.github.languages.find_by(name: lang).update(count: count)
        else
          user.github.languages.create(name: lang, count: count)
        end
      end
      Achievement.update(user)
      Pass.update(user)
      logger.info "-- update_github_status -- #{user.github.languages.to_yaml}"
      logger.info "#{Time.now} -- complete! -- "
      logger.info "------------------------------------------------------"
    end
  end
end
