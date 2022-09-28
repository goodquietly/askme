class Question < ApplicationRecord
  REGEXP_FOR_TAGS = /#[[:word:]-]+/
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :question_hashtags
  has_many :hashtags, through: :question_hashtags, dependent: :destroy

  after_save_commit :find_and_create_hashtags

  private

  def find_and_create_hashtags
    question_hashtags = "#{body} + #{answer}".scan(REGEXP_FOR_TAGS)

    self.hashtags = question_hashtags.uniq.map do |tag|
      Hashtag.find_or_create_by(name: tag.downcase)
    end
  end
end
