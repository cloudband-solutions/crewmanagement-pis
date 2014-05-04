class AddManningAgentIdToEmployeeRecords < ActiveRecord::Migration
  def change
    remove_column :employment_records, :manning_agent
    add_column :employment_records, :manning_agent_id, :integer
  end
end
