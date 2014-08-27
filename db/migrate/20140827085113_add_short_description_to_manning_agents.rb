class AddShortDescriptionToManningAgents < ActiveRecord::Migration
  def change
    add_column :manning_agents, :short_description, :text
  end
end
