class UserExam < ApplicationRecord
  belongs_to :exam
  belongs_to :user

  scope :order_by_name, -> { order :name }

  def self.search(name)
    where("name LIKE ?", "%#{name}%")
  end
end
