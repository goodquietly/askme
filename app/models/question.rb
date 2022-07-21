class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags
end
