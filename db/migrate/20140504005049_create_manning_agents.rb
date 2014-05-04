class CreateManningAgents < ActiveRecord::Migration
  def change
    create_table :manning_agents do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
