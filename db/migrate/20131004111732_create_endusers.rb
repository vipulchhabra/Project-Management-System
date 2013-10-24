class CreateEndusers < ActiveRecord::Migration
  def change
      create_table :endusers do |t|
      t.string :firstname
      t.string :lastname
      t.integer :empno
      t.date :dateofbirth
      t.text :address

      t.timestamps
    end
  end
end
