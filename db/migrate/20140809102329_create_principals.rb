class CreatePrincipals < ActiveRecord::Migration
  def change
    create_table :principals do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :telephone_number
      t.string :fax_number

      t.timestamps
    end
  end
end
