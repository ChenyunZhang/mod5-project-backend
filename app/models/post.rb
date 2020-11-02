class Post < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :category
  belongs_to :user

  def created_time
    self.created_at.strftime("%m/%d/%Y %I:%M%p")
  end
end
