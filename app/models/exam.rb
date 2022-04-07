class Exam < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :user_exams, dependent: :destroy
end
