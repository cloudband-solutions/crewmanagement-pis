class CreateCrewOfficeEvaluations < ActiveRecord::Migration
  def change
    create_table :crew_office_evaluations do |t|
      t.integer :vessel_id
      t.integer :crew_id
      t.date :date_of_evaluation

      t.timestamps
    end
  end
end
