class User < ApplicationRecord
  has_many :user_exams, dependent: :destroy
end
