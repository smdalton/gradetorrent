class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to  :organization
  has_and_belongs_to_many :course
  enum role: [:student, :teacher, :admin]
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
