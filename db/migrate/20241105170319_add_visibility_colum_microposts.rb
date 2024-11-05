class AddVisibilityColumMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :visibility, :boolean, default: false, null: false
  end
end
