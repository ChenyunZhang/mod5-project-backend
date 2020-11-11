class Post < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :user
  belongs_to :book
  has_many :votedowns, dependent: :destroy
  has_many :voteups, dependent: :destroy

  def created_time
    self.created_at.strftime("%m/%d/%Y %I:%M%p")
  end
end
