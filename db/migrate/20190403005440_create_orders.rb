class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :shipping_address
      t.string :tenant_name
      t.string :tenant_email
      t.string :size10b20
      t.string :size14b20
      t.string :size16b24
      t.string :size18b30
      t.string :size12b12
      t.string :size14b24
      t.string :size16b25
      t.string :size20b20
      t.string :size12b20
      t.string :size14b25
      t.string :size18b18
      t.string :size20b24
      t.string :size12b24
      t.string :size14b30
      t.string :size18b20
      t.string :size20b25
      t.string :size12b30
      t.string :size15b20
      t.string :size18b24
      t.string :size20b30
      t.string :size12b36
      t.string :size16b20
      t.string :size18b25
      t.string :size24b24
      t.string :size25b25
      t.integer :property
      t.string :order_status
      t.integer :user
      t.float :amount_paid

      t.timestamps null: false
    end
  end
end
