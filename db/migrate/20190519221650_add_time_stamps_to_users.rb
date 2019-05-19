class AddTimeStampsToUsers < ActiveRecord::Migration
  def change_table
    add_column :users, :created_at, :datetime, null: false
    add_column :users, :updated_at, :datetime, null: false
  end
end
