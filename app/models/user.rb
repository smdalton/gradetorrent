class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to  :organization
  enum role: [:student, :teacher, :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
