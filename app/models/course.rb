class Course < ApplicationRecord
  belongs_to  :organization
  has_many    :assignments
  has_many :course_users
  has_many :users, :through => :course_users

  validates_presence_of :organization

  def teacher
    CourseUser.joins(:user).where('users.type = "Teacher"').where(course: self).first
  end

  def students
    CourseUser.joins(:user).where('users.type = "Student"').where(course: self)
  end

end
