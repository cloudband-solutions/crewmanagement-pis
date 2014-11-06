class AddLicenseCategoryIdToLicenseTypes < ActiveRecord::Migration
  def change
    add_column :license_types, :license_category_id, :integer
  end
end
