class User < ApplicationRecord
  has_many :courses
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_secure_password
end
