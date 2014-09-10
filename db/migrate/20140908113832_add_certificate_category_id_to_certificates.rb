class AddCertificateCategoryIdToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :certificate_categry_id, :integer
  end
end
