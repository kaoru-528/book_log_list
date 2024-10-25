class AddTextColumMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :comment, :text
  end
end
