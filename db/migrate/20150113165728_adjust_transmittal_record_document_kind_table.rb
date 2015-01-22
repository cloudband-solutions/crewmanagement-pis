class AdjustTransmittalRecordDocumentKindTable < ActiveRecord::Migration
  def change
    drop_table :transmittal_records_document_kinds

    create_table :transmittal_record_document_kinds, id: false do |t|
      t.references :transmittal_record
      t.references :document_kind
    end

    add_index :transmittal_record_document_kinds, [:transmittal_record_id, :document_kind_id], unique: true, name: 'tr_dk_index'
  end
end
