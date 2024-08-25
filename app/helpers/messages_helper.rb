module MessagesHelper
  def with_mentions(text)
    text.gsub(/@(\w+)/) do |mention|
      username = mention[1..]
      link_to mention, user_path(username), class: 'text-blue-500'
    end
  end
end
