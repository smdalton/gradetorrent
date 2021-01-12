# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveSupport::NumberHelper.number_to_human(5)


def make_organizations
  3.times do |i|
    Organization.create! do |org|
      ActiveSupport::NumberHelper.number_to_human(5)
      org.name = Faker::University.name
      org.state = 'Washington'
    end
  end
end

def make_students
  Student.create do |u|
    u.email = 'smdstudent@gmail.com'
    u.password = 'password'
    u.encrypted_password = '$2a$11$MK9LXCGG9wbztJk7eXi5zeZju.Re1HWTL8UfMffElwMTGUbhMbCoG'
    u.name = Faker::Cosmere.knight_radiant
    u.organization = Organization.first
  end
  225.times do |i|
    Student.create! do |u|
      u.email = Faker::Internet.email
      u.password = 'password'
      u.encrypted_password = '$2a$11$MK9LXCGG9wbztJk7eXi5zeZju.Re1HWTL8UfMffElwMTGUbhMbCoG'
      u.name = Faker::Cosmere.knight_radiant
      u.organization = Organization.first
    end
  end
end

def make_teachers
  begin
    Teacher.create! do |t|
      t.email = 'smd@gmail.com'
      t.password = 'password'
      t.encrypted_password = '$2a$11$MK9LXCGG9wbztJk7eXi5zeZju.Re1HWTL8UfMffElwMTGUbhMbCoG'
      t.name = Faker::Cosmere.knight_radiant
      t.organization = Organization.first
    end
    3.times do |i|
      Teacher.create! do |u|
        u.email = Faker::Internet.email
        u.password = 'password'
        u.encrypted_password = '$2a$11$MK9LXCGG9wbztJk7eXi5zeZju.Re1HWTL8UfMffElwMTGUbhMbCoG'
        u.name = Faker::Cosmere.knight_radiant
        u.organization = Organization.first
      end
    end
  rescue Exception => e;
  end
end

def make_administrator
  1.times do |i|
    Administrator.create! do |u|
      u.email = Faker::Internet.email
      u.password = 'password'
      u.encrypted_password = '$2a$11$MK9LXCGG9wbztJk7eXi5zeZju.Re1HWTL8UfMffElwMTGUbhMbCoG'
      u.name = Faker::Cosmere.knight_radiant
      u.organization = Organization.first
    end
  end
end

def make_courses
  5.times do |i|
    Course.create! do |c|
      c.name = Faker::Educator.course_name
      c.description = Faker::Hipster.sentence(word_count: 6)
      c.organization = Organization.first
      c.start_date = DateTime.now
      c.end_date = DateTime.now + 1.month
    end
  end
end

def assign_students_to_courses
  courses = Course.all.limit(5).to_a
  students = Student.all.to_a
  students.each do |student|
    4.times do |e|
      CourseUser.create!(course: courses[e], user: student)
    end
  end
end

def assign_teachers_to_courses
  teachers = Teacher.all.to_a
  courses = Course.all.limit(teachers.count)
  courses.length.times do |i|
    CourseUser.create!(course: courses[i], user: teachers[i])
  end
end

def make_assignments
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
end

make_organizations
make_students
make_teachers
# make_administrators
make_courses
assign_students_to_courses
assign_teachers_to_courses
# make_assignments