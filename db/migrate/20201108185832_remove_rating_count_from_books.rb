class RemoveRatingCountFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :rating_count, :integer
  end
end
