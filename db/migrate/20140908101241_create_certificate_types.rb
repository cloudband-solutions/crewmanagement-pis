class CreateCertificateTypes < ActiveRecord::Migration
  def change
    create_table :certificate_types do |t|
      t.string :name
      t.string :code
      t.integer :priority

      t.timestamps
    end
  end
end
