class AddIsRevertingToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :is_reverting, :boolean
  end
end
