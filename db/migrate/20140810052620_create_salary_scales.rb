class CreateSalaryScales < ActiveRecord::Migration
  def change
    create_table :salary_scales do |t|
      t.decimal :minimum
      t.decimal :maxiumum

      t.timestamps
    end
  end
end
