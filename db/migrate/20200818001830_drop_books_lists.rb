class DropBooksLists < ActiveRecord::Migration[6.0]
  def change
    drop_table :books_lists
  end

end
