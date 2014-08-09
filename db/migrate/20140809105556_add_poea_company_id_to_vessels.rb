class AddPoeaCompanyIdToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :poea_company_id, :integer
  end
end
