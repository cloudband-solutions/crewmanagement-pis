class AddShortDescriptionToRanks < ActiveRecord::Migration
  def change
    add_column :ranks, :short_description, :text
  end
end
