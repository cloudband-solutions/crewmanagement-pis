class AddCertificateTypeIdToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :certificate_type_id, :integer
  end
end
