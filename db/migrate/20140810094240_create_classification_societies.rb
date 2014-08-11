class CreateClassificationSocieties < ActiveRecord::Migration
  def change
    create_table :classification_societies do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
