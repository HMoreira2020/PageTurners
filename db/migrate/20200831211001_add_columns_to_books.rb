class AddColumnsToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :genre, :string
    add_column :books, :average_rating, :float
  end
end
