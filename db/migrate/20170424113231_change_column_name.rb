class ChangeColumnName < ActiveRecord::Migration[5.0]
  def up
    rename_column :projects, :type, :project_type
  end
  def down
  end
end
