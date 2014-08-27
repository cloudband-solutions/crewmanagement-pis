class AddShortDescriptionToClassificationSocieties < ActiveRecord::Migration
  def change
    add_column :classification_societies, :short_description, :text
  end
end
