class AddIsArchivedToCrews < ActiveRecord::Migration
  def change
    remove_column :crews, :archived
    add_column :crews, :is_archived, :boolean
  end
end
