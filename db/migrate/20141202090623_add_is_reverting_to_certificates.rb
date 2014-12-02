class AddIsRevertingToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :is_reverting, :boolean
  end
end
