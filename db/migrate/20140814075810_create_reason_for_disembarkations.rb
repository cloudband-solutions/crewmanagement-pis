class CreateReasonForDisembarkations < ActiveRecord::Migration
  def change
    create_table :reason_for_disembarkations do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
