class Rename < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :login, :name

  end
end

