class AddShortDescriptionToDocumentKinds < ActiveRecord::Migration
  def change
    add_column :document_kinds, :short_description, :text
  end
end
