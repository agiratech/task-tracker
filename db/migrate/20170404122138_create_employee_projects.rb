class CreateEmployeeProjects < ActiveRecord::Migration[5.0]
  def up
    create_table :employee_projects do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :project, index: true
      t.belongs_to :role, index: true
      t.timestamps
    end
  end
  def down
  end
end
