class CreateCertificateCategories < ActiveRecord::Migration
  def change
    create_table :certificate_categories do |t|
      t.string :name
      t.string :code
      t.integer :priority

      t.timestamps
    end
  end
end
