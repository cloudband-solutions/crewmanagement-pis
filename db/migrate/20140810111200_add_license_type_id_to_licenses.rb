class AddLicenseTypeIdToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :license_type_id, :integer
  end
end
