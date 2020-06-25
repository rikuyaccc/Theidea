class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :image_name, :string
    add_column :users, :profile, :text
  end
end
