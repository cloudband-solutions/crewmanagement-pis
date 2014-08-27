class AddShortDescriptionToLicenseTypes < ActiveRecord::Migration
  def change
    add_column :license_types, :short_description, :text
  end
end
