class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :email, :avatar

  has_many :posts
  has_many :votedowns
  has_many :voteups
  has_many :books, through: :posts

  def avatar
    if object.avatar.attached?
      {
        url: rails_blob_url(object.avatar)
      }
    end
  end

end
