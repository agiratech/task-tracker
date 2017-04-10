class CreateRoles < ActiveRecord::Migration[5.0]
  def up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
  end
  def down
  end
end
