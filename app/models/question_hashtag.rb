class QuestionHashtag < ApplicationRecord
  belongs_to :hashtag
  belongs_to :question

  def self.popular_hashtad_ids
    group(:hashtag_id).count(:id).sort_by(&:last).reverse.to_h.keys
  end
end
