class CreateJoinprousers < ActiveRecord::Migration
  def change
    create_table :joinprousers do |t|
      t.integer :enduser_id
      t.integer :project_id

      t.timestamps
    end
  end
end
