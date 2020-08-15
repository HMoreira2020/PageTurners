class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :synopsis
      t.belongs_to :genre, foreign_key: true

      t.timestamps
    end
  end
end
