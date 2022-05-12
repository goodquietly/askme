class Question < ApplicationRecord
  validates :body, presence: true, uniqueness: true, length: { maximum: 280 }
end
