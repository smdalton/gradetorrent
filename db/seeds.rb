# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveSupport::NumberHelper.number_to_human(5)


3.times do |i|
  Organization.create! do |org|
    ActiveSupport::NumberHelper.number_to_human(5)
    org.name = Faker::University.name
    org.state = 'Washington'
  end
end


begin
  10.times do |i|
    User.create! do |u|
      u.email = Faker::Internet.email
      u.password = 'password'
      u.encrypted_password = "$2a$11$MK9LXCGG9wbztJk7eXi5zeZju.Re1HWTL8UfMffElwMTGUbhMbCoG"
      u.name = Faker::Fantasy.name
      u.organization = Organization.first
    end
  end
rescue Exception => e
  ## Skipped email unique constraint checking with rescue block
end


5.times do |i|
  Course.create! do |c|
    c.name = Faker::Educator.course_name
    c.description = Faker::Hipster.sentence(word_count: 6)
    c.organization = Organization.first
    c.start_date = DateTime.now
    c.end_date = DateTime.now + 1.month
  end
end

25.times do |i|
  Assignment.create! do |a|
    a.name = "Study of #{Faker::Space.nasa_space_craft}"
    a.description = Faker::Hacker.say_something_smart
    a.rubric = Faker::Hacker.say_something_smart
    a.assigned_on = DateTime.now
    a.due_by = DateTime.now + 1.week
    a.eval_by = DateTime.now + 10.days
    a.max_score = 20
    a.course = i.even? ? Course.first : Course.second
  end
end
