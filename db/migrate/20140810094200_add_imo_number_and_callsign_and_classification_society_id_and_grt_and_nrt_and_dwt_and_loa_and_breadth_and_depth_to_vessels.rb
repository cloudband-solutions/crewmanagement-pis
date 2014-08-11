class AddImoNumberAndCallsignAndClassificationSocietyIdAndGrtAndNrtAndDwtAndLoaAndBreadthAndDepthToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :imo_number, :string
    add_column :vessels, :callsign, :string
    add_column :vessels, :classification_society_id, :integer
    add_column :vessels, :grt, :decimal
    add_column :vessels, :nrt, :decimal
    add_column :vessels, :dwt, :decimal
    add_column :vessels, :loa, :decimal
    add_column :vessels, :breadth, :decimal
    add_column :vessels, :depth, :decimal
  end
end
