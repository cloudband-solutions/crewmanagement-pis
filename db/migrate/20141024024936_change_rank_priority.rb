class ChangeRankPriority < ActiveRecord::Migration
  def change
    change_column :ranks, :priority, :decimal
  end
end
