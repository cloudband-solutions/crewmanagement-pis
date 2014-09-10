class ModifyCertificateCategoryIdInCertificates < ActiveRecord::Migration
  def change
    remove_column :certificates, :certificate_categry_id
    add_column :certificates, :certificate_category_id, :integer
  end
end
