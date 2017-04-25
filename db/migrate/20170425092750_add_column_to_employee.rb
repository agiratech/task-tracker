class AddColumnToEmployee < ActiveRecord::Migration[5.0]
  def up
    add_column :employees, :role_type, :string
  end
  def down
  end
end
