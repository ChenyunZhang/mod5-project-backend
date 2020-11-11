class BookSerializer < ActiveModel::Serializer
  attributes :id, :description, :imageLink, :category, :title, :book_author,:book_textsnippet

  has_many :posts

end
