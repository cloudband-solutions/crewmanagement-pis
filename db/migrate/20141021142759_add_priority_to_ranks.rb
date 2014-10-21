class AddPriorityToRanks < ActiveRecord::Migration
  def change
    add_column :ranks, :priority, :integer
  end
end
