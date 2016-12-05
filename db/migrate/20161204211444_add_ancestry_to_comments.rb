class AddAncestryToComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :ancestry
    add_column :comments, :ancestry, :string
    add_index :comments, :ancestry
  end
end
