class ChangeDataTypeForDateofbirth < ActiveRecord::Migration
  def change
  	change_column :endusers, :dateofbirth, :string
  end
end
