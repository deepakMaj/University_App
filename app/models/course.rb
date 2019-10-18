class Course < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 40, maximum: 150}
end
