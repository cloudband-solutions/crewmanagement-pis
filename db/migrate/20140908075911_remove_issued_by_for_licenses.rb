class RemoveIssuedByForLicenses < ActiveRecord::Migration
  def change
    remove_column :licenses, :issued_by
  end
end
