class AddAttachmentVesselImageToVessels < ActiveRecord::Migration
  def self.up
    change_table :vessels do |t|
      t.attachment :vessel_image
    end
  end

  def self.down
    remove_attachment :vessels, :vessel_image
  end
end
