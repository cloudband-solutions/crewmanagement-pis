class AddManningAgentIdToTransmittalRecordDisembarkingCrews < ActiveRecord::Migration
  def change
    add_column :transmittal_record_disembarking_crews, :manning_agent_id, :integer
  end
end
