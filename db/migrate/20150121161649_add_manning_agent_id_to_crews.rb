class AddManningAgentIdToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :manning_agent_id, :integer
  end
end
