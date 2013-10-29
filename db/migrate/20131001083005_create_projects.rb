class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :fieldname
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
