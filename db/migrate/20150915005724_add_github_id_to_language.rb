class AddGithubIdToLanguage < ActiveRecord::Migration
  def change
    add_reference :languages, :github, index: true, foreign_key: true
  end
end
