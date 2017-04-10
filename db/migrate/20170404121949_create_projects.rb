class CreateProjects < ActiveRecord::Migration[5.0]
  def up
    create_table :projects do |t|
      t.string :name
      t.string :type
      t.date :start_date
      t.date :end_date
      t.float :hours
      t.boolean :is_billable, default: false
      t.timestamps
    end
  end
  def down
  end
end
