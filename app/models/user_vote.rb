class UserVote < ActiveRecord::Base

  belongs_to :user
  belongs_to :dog_image

  validates :user, presence: true
  validates :dog_image, presence: true
end
