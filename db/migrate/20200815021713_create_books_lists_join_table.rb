class CreateBooksListsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :books, :lists do |t|
      t.index [:list_id, :book_id]
    end
  end
end
