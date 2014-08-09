class CreatePrincipalContactPeople < ActiveRecord::Migration
  def change
    create_table :principal_contact_people do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_number
      t.string :email
      t.string :designation
      t.integer :principal_id

      t.timestamps
    end
  end
end
