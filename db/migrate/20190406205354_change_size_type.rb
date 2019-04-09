class ChangeSizeType < ActiveRecord::Migration
  def change
        change_column :orders,  :size10b20, :integer
        change_column :orders,  :size14b20, :integer
        change_column :orders,  :size16b24, :integer
        change_column :orders,  :size18b30, :integer
        change_column :orders,  :size12b12, :integer
        change_column :orders,  :size14b24, :integer
        change_column :orders,  :size16b25, :integer
        change_column :orders,  :size20b20, :integer
        change_column :orders,  :size12b20, :integer
        change_column :orders,  :size14b25, :integer
        change_column :orders,  :size18b18, :integer
        change_column :orders,  :size20b24, :integer
        change_column :orders,  :size12b24, :integer
        change_column :orders,  :size14b30, :integer
        change_column :orders,  :size18b20, :integer
        change_column :orders,  :size20b25, :integer
        change_column :orders,  :size12b30, :integer
        change_column :orders,  :size15b20, :integer
        change_column :orders,  :size18b24, :integer
        change_column :orders,  :size20b30, :integer
        change_column :orders,  :size12b36, :integer
        change_column :orders,  :size16b20, :integer
        change_column :orders,  :size18b25, :integer
        change_column :orders,  :size24b24, :integer
        change_column :orders,  :size25b25, :integer
  end
end
