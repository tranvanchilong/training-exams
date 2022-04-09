class User < ApplicationRecord
  has_many :user_exams, dependent: :destroy
  validates :name, presence: true,
                   length: { maximum: Settings.model.user.name_length_max }
  validates :email, format: { with: Settings.email_regex },
                    length: { maximum: Settings.model.user.email_length_max },
                    uniqueness: { case_sensitive: false },
                    presence: true
  has_secure_password
  validates :password, length: { minimum: Settings.model.user.password_length_min },
                        presence: true

  enum role: {user: 0, admin: 1}

  private

  def downcase_email
    self.email = email.downcase
  end
end
