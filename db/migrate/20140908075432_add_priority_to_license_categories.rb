class AddPriorityToLicenseCategories < ActiveRecord::Migration
  def change
    add_column :license_categories, :priority, :integer
  end
end
