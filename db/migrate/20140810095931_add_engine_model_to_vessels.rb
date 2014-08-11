class AddEngineModelToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :engine_model, :string
  end
end
