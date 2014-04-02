class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.string :name
      t.string :flag
      t.string :vessel_type
      t.integer :horse_power
      t.string :engine_make

      t.timestamps
    end
  end
end
