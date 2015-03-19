class AddNoExpiryToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :no_expiry, :boolean
  end
end
