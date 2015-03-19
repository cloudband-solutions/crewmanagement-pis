class AddNoExpiryToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :no_expiry, :boolean
  end
end
