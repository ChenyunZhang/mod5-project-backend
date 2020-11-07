class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_average_rating
      t.string :description
      t.integer :rating_count
      t.string :imageLink
      t.string :category
      t.string :title

      t.timestamps
    end
  end
end
