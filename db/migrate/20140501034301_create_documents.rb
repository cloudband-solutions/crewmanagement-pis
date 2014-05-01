class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :crew_id
      t.string :name
      t.string :doc_number
      t.date :issued_at
      t.date :expiry_date
      t.string :issued_by

      t.timestamps
    end
  end
end
