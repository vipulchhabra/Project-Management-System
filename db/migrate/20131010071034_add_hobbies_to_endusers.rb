class AddHobbiesToEndusers < ActiveRecord::Migration
  def change
    add_column :endusers, :hobbies, :string
  end
end
