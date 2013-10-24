class AddGenderToEndusers < ActiveRecord::Migration
  def change
    add_column :endusers, :gender, :string
  end
end
