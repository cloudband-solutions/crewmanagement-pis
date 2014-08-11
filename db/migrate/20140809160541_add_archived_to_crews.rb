class AddArchivedToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :archived, :boolean
  end
end
