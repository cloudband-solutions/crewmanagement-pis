class ChangeRankPriorityToIncludePrecision < ActiveRecord::Migration
  def change
    change_column :ranks, :priority, :decimal, scale: 15, precision: 18
  end
end
