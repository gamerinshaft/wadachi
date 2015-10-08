class Pass < ActiveRecord::Base
  belongs_to :user
  belongs_to :area

  class << self
    def create(user)

    end

    def update(user)
      update_pass(user)
    end

    private

    def update_pass(user)
      user.github.languages.each do |lang|

        achievement = user.achievements.find_by(name: "#{lang.name}コミッター初級")
        judge(user, "初めての#{lang.name}", achievement)

        achievement = user.achievements.find_by(name: "#{lang.name}コミッター中級")
        judge(user, "#{lang.name}の村", achievement)

        achievement = user.achievements.find_by(name: "#{lang.name}コミッター上級")
        judge(user, "#{lang.name}上級特区", achievement)

      end
    end

    def judge(user, areaName, achievement)
      if achievement.present? && achievement.status == 1
        area = Area.find_by(name: areaName)
        unless user.passes.exists?(area_id: area.id)
          user.pass_areas << area
        end
      end
    end
  end
end
