class AddDocumentKindIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :document_kind_id, :integer
  end
end
