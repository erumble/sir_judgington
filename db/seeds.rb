# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

# Create the static categories
categories = %w(anime manga video_game other_media)
categories.each do |category|
  Category.where(name: category, common: true).first_or_create
end
puts "CREATED CATEGORIES: #{categories.join(', ').humanize.titleize}"

# Create the static judging times
judging_times = %w(10:00 10:15 10:30 10:45
                   11:00 11:15 11:30 11:45
                               12:30 12:45
                    1:00  1:15  1:30  1:45
                    2:00  2:15  2:30  2:45)
judging_times.each do |time|
  JudgingTime.where(time: time, common: true).first_or_create
end
puts "CREATED JUDGING TIMES: #{judging_times.join(', ').humanize}"
