class CreateEndusersProjects < ActiveRecord::Migration
  def change
    create_table :endusers_projects do |t|
      t.integer :enduser_id
      t.integer :project_id

      t.timestamps
    end
  end
end
