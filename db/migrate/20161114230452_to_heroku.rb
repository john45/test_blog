class ToHeroku < ActiveRecord::Migration[5.0]
  def change
    drop_table :users
    drop_table :posts
  end
end
