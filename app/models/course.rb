class Course < ApplicationRecord
  belongs_to  :organization
  has_many    :assignments
  has_many :course_users
  has_many :users, :through => :courses_users

  validates_presence_of :organization

  def teacher_of_course

  end

  def students
    CourseUser.joins(:user).where('users.type = "Student"')
  end

  def teachers
    CourseUser.joins(:user).where('users.type = "Teacher"')
  end

end
