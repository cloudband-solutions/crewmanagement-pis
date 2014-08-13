class CreateTrainingCenters < ActiveRecord::Migration
  def change
    create_table :training_centers do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
