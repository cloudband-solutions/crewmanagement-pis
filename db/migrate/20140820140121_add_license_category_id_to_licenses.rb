class AddLicenseCategoryIdToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :license_category_id, :integer
  end
end
