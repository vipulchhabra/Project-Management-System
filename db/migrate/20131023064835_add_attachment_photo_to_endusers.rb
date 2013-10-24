class AddAttachmentPhotoToEndusers < ActiveRecord::Migration
  def self.up
    change_table :endusers do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :endusers, :photo
  end
end
