class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attribute :type, :string, default: 'Student'
  belongs_to :organization
  has_many :course_users
  has_many :courses, :through => :course_users
  # enum role: [:student, :teacher, :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def teacher?
    type == 'Teacher'
  end

  def student?
    type == 'Student'
  end

  def administrator?
    type == 'Administrator'
  end
end
