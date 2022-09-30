module QuestionsHelper
  def body_with_link_hashtag(question)
    question.hashtags.each do |tag|
      question.body.gsub!(/#{tag.name}/) { |name| link_to name, hashtag_path(tag) }
    end

    sanitize question.body
  end
end
