class ChangeColumnInBooks < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :image, :image_url
  end
end
