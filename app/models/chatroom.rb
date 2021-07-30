class Chatroom < ApplicationRecord
  has_many :messages

  def self.check_db(name)
    where(name: name).first
  end
end
