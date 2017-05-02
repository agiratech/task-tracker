class CreateTimeEntries < ActiveRecord::Migration[5.0]
  def up
    create_table :time_entries do |t|
      t.date :date
      t.integer :mentor_id
      t.text :task
      t.float :hours
      t.boolean :is_billable, default: false
      t.belongs_to :employee, index: true
      t.belongs_to :project, index: true
      t.timestamps
    end
  end
  def down
  end
end
