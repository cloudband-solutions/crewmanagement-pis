class AddIsDefaultToLicenseTypesAndCertificateTypesAndDocumentKinds < ActiveRecord::Migration
  def change
    add_column :license_types, :is_default, :boolean
    add_column :certificate_types, :is_default, :boolean
    add_column :document_kinds, :is_default, :boolean
  end
end
