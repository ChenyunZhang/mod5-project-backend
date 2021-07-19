class Post < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :user
  belongs_to :book
  has_many :votedowns, dependent: :destroy
  has_many :voteups, dependent: :destroy

  def created_time
    self.created_at.in_time_zone('EST').strftime("%m/%d/%Y %T")
  end
end
