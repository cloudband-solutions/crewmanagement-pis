class CreateEducationalAttainments < ActiveRecord::Migration
  def change
    create_table :educational_attainments do |t|
      t.integer :crew_id
      t.integer :year_graduated
      t.string :school
      t.string :course_finished

      t.timestamps
    end
  end
end
