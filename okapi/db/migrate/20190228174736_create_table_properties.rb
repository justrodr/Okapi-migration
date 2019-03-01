class CreateTableProperties < ActiveRecord::Migration
  def change
    create_table :table_properties do |t|
      t.string :user
      t.string :property_name
      t.string :tenant_name
      t.string :tenant_email
      t.string :tenant_number
      t.string :address
      t.string :frequency
      t.string :last_change_date
      t.string :next_change_date
    end
  end
end
