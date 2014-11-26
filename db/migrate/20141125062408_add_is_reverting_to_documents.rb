class AddIsRevertingToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :is_reverting, :boolean
  end
end
