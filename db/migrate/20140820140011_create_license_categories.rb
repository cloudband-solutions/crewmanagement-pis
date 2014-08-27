class CreateLicenseCategories < ActiveRecord::Migration
  def change
    create_table :license_categories do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
