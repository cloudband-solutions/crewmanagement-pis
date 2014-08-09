class CreatePoeaCompanies < ActiveRecord::Migration
  def change
    create_table :poea_companies do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
