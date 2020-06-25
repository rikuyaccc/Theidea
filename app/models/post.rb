class Post < ApplicationRecord
  validates :user_id, presence: true

  def user
    return User.find(self.user_id)
  end
  
end
