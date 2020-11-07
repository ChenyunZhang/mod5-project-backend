class AddBookAuthorToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :book_author, :string
    add_column :books, :book_textsnippet, :string
  end
end
