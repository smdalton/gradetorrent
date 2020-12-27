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
    org.name = "College #{i} of the PNW"
    org.state = 'Washington'
  end
end

begin
  5.times do |i|
    User.create! do |u|
      u.email = "smd#{i + 1}@gmail.com"
      u.password = 'password'
      u.name = "Shane #{i}"
      u.organization = Organization.first
    end
  end
rescue Exception => e
  ## Skipped email unique constraint checking with rescue block
end

5.times do |i|
  Course.create! do |c|
    c.name = Faker::Hipster.sentence(word_count: 2)
    c.description = Faker::Hipster.sentence(word_count: 6)
    c.organization = Organization.first
    c.start_date = DateTime.now
    c.end_date = DateTime.now + 1.month
  end
end
