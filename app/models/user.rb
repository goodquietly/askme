class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname
  before_validation :downcase_email

  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w\-.]+@[\w\-]+\.[a-z]+\z/i }

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 },
                       format: { with: /\A\w+\z/i }

  validates :navbar_color, format: { with: /\A#[[:xdigit:]]{6}\z/ }

  private

  def downcase_nickname
    nickname&.downcase!
  end

  def downcase_email
    email&.downcase!
  end
end
