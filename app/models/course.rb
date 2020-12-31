class Course < ApplicationRecord
  belongs_to  :organization
  has_many    :assignments
  has_and_belongs_to_many :user
  validates_presence_of :organization
  validates_presence_of :user
end
