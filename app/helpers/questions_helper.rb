module QuestionsHelper
  def text_with_link_hashtag(hashtags, text)
    hashtags.each do |tag|
      text.gsub!(/#{tag.name}/) { |name| link_to name, hashtag_path(tag) }
    end

    simple_format(text)
  end
end
