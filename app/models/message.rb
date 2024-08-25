class Message < ApplicationRecord
  has_many :mentions, dependent: :destroy

  after_create_commit :generate_mentions

  private

  def generate_mentions
    mentioned_usernames = body.scan(/@(\w+)/).flatten
    users = User.where(username: mentioned_usernames)
    users.each do |user|
      self.mentions.create(user: user)
    end
  end
end
