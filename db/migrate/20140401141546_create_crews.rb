class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.string :form_number
      t.string :code_number
      t.date :date_employed
      t.date :date_printed
      t.integer :rank_id
      t.integer :vessel_id
      t.string :surname
      t.string :lastname
      t.string :firstname
      t.date :birthday
      t.string :birthplace
      t.string :telephone_no
      t.string :nationality
      t.string :civil_status
      t.integer :age
      t.decimal :height
      t.decimal :weight
      t.string :eye_color
      t.string :sss_no
      t.string :tin_no
      t.string :shoe_size
      t.string :cloth_size
      t.string :nearest_relative_name
      t.string :nearest_relative_relationship
      t.text :nearest_relative_address
      t.text :address

      t.timestamps
    end
  end
end
