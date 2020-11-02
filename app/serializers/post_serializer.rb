class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content,:image
  has_one :category
  has_one :user

  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image)
      }
    end
  end

end
