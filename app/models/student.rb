class Student < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  has_many :student_courses
  has_many :courses, through: :student_courses
end
