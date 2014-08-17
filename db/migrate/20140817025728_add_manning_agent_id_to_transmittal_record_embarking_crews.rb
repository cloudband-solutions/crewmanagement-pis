class AddManningAgentIdToTransmittalRecordEmbarkingCrews < ActiveRecord::Migration
  def change
    add_column :transmittal_record_embarking_crews, :manning_agent_id, :integer
  end
end
