class RemoveIsArchivedFromCrews < ActiveRecord::Migration
  def change
    remove_column :crews, :is_archived
  end
end
