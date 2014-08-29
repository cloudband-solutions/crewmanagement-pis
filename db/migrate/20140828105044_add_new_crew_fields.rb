class AddNewCrewFields < ActiveRecord::Migration
  def change
    add_column(:crews, :city_address, :string)
    add_column(:crews, :provincial_address, :string)
    add_column(:crews, :zip_code, :string)
    add_column(:crews, :blood_type, :string)
    add_column(:crews, :father_name, :string)
    add_column(:crews, :mother_maiden_name, :string)
    add_column(:crews, :spouse_name, :string)
    add_column(:crews, :number_of_children, :integer)
    add_column(:crews, :is_smoker, :boolean)
    add_column(:crews, :blood_pressure, :string)
  end
end
