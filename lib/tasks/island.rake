namespace :island do
  desc "islandの島を生成"

  task :update => :environment do
    logger = Logger.new('log/island.log')
    logger.info "------------------------------------------------------"
    logger.info "#{Time.now} -- starting_task -- "
    Island.update()
    logger = Logger.new('log/island.log')
    logger.info "------------------------------------------------------"
    logger.info "------------------------------------------------------"
  end
end
