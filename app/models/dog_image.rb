class DogImage < ActiveRecord::Base

  belongs_to :user
  has_many :user_votes, dependent: :destroy

  validates :img_url, presence: true
  validates :user_id, presence: true

  scope :with_votes, ->  { joins(:user_votes).uniq }

  def voters_include?(user)
    user_votes.where(user: user).any?
  end

  def upvote(user:)
    user.user_votes.create(dog_image: self)
  end
end
