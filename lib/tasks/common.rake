namespace :common do
  desc "TODO"
  task db_reset: :environment do
    system("bundle exec rake db:drop")
    system("bundle exec rake db:create")
    system("bundle exec rake db:migrate")
    system("bundle exec rake db:seed")
  end

  desc "TODO"
  task db_reset_test: :environment do
    system("bundle exec rake db:drop RAILS_ENV=test")
    system("bundle exec rake db:create RAILS_ENV=test")
    system("bundle exec rake db:migrate RAILS_ENV=test")
    system("bundle exec rake db:seed RAILS_ENV=test")
  end

end