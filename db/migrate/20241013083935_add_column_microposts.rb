class AddColumnMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :title, :string
    add_column :microposts, :image_url, :string
  end
end
