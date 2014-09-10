class AddPriorityToLicenseTypes < ActiveRecord::Migration
  def change
    add_column :license_types, :priority, :integer
  end
end
