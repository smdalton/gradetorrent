class Teacher < User
  has_many :courses_users
  has_many :courses, :through => :courses_users
end
