class CreateDocumentKinds < ActiveRecord::Migration
  def change
    create_table :document_kinds do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
