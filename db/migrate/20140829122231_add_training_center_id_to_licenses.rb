class AddTrainingCenterIdToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :training_center_id, :integer
  end
end
