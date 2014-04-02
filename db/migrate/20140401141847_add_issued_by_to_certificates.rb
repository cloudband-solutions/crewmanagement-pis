class AddIssuedByToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :issued_by, :string
  end
end
