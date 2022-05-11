class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true
  # uniqueness: { case_sensitive: false }, length: { maximum: 50 },
  # format: { with: ConstantData::VALID_EMAIL_REGEX }, if: :method_name?

  def downcase_nickname
    nickname.downcase!
  end
end
