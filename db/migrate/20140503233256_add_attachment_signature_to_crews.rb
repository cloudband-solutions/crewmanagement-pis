class AddAttachmentSignatureToCrews < ActiveRecord::Migration
  def self.up
    change_table :crews do |t|
      t.attachment :signature
    end
  end

  def self.down
    drop_attached_file :crews, :signature
  end
end
