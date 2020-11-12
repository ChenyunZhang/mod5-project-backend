class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :content,:image,:created_time,:created_at
  has_one :book
  has_one :user
  has_many :votedowns
  has_many :voteups

  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image)
      }
    end
  end

end
