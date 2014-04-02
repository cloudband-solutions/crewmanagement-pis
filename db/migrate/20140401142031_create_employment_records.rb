class CreateEmploymentRecords < ActiveRecord::Migration
  def change
    create_table :employment_records do |t|
      t.integer :vessel_id
      t.string :manning_agent
      t.string :rank
      t.date :sign_on
      t.date :sign_off
      t.string :reason_of_disembarkation

      t.timestamps
    end
  end
end
