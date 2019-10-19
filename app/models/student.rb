class Student < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false},
            length: { minimum: 8, maximum: 20}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  has_many :student_courses
  has_many :courses, through: :student_courses
end
