class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w\d\-]+@[\w\d\-]+\.\w+\z/i }

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 },
                       format: { with: /\A[\w\d]+\z/i }

  private

  def downcase_nickname
    nickname.downcase!
  end
end
