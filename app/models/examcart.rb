class Examcart < ApplicationRecord
    belongs_to :user, class_name: "User"
    belongs_to :exam, class_name: "User"
    validates :user_id, presence: true
    validates :exam_id, presence: true
end
