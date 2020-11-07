class AddBookIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :book, null: false
  end
end
