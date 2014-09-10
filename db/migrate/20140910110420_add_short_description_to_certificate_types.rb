class AddShortDescriptionToCertificateTypes < ActiveRecord::Migration
  def change
    add_column :certificate_types, :short_description, :text
  end
end
