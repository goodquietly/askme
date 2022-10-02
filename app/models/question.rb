class Question < ApplicationRecord
  REGEXP_FOR_TAGS = /#[[:word:]-]+/
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hashtags
  has_many :hashtags, through: :question_hashtags, dependent: :destroy

  before_save :downcase_hashtags_body_and_answer
  after_save_commit :find_and_create_hashtags

  private

  def downcase_hashtags_body_and_answer
    body.gsub!(REGEXP_FOR_TAGS) { |tag| tag&.downcase }
    answer&.gsub!(REGEXP_FOR_TAGS) { |tag| tag&.downcase }
  end

  def find_and_create_hashtags
    question_hashtags = "#{body} + #{answer}".scan(REGEXP_FOR_TAGS)

    self.hashtags = question_hashtags.uniq.map do |tag|
      Hashtag.find_or_create_by(name: tag.downcase)
    end
  end

  def self.most_answered_users_ids
    where.not(answer: nil).group(:user_id).count.sort_by(&:last).reverse.to_h.keys
  end
end
