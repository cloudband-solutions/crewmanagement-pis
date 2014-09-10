class AddFlagIdToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :flag_id, :integer
  end
end
