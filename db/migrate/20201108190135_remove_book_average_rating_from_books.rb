class RemoveBookAverageRatingFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :book_average_rating, :string
  end
end
