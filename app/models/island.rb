class Island < ActiveRecord::Base
  has_many :areas, dependent: :destroy
  class << self
    def update
      languages = {}
      User.all.each do |user|
        user.github.languages.each do |language|
          if  languages.key?(language.name.to_sym)
            languages[language.name.to_sym] += language.count
          else
            languages[language.name.to_sym] = language.count
          end
        end
      end
      languages.each do |lang, count|
        if Island.exists?(name: lang)
          Island.update(power: count)
        else
          island = Island.create(name: lang, power: count)
          island.areas.create(name: "初めての#{lang}")
          island.areas.create(name: "#{lang}の村")
          island.areas.create(name: "#{lang}上級特区")
        end
      end
    end
  end
end
