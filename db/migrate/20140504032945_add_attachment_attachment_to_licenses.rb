class AddAttachmentAttachmentToLicenses < ActiveRecord::Migration
  def self.up
    change_table :licenses do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :licenses, :attachment
  end
end
