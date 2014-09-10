class AddAttachmentAttachmentToCertificates < ActiveRecord::Migration
  def self.up
    change_table :certificates do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :certificates, :attachment
  end
end
