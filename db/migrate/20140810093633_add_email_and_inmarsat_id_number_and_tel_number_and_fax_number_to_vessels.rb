class AddEmailAndInmarsatIdNumberAndTelNumberAndFaxNumberToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :email, :string
    add_column :vessels, :inmarsat_id_number, :string
    add_column :vessels, :tel_number, :string
    add_column :vessels, :fax_number, :string
  end
end
