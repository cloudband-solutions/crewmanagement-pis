class AddAttachmentPictureToCrews < ActiveRecord::Migration
  def self.up
    change_table :crews do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :crews, :picture
  end
end
