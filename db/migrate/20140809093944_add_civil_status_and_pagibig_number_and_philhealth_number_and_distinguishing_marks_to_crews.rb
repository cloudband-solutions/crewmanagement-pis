class AddCivilStatusAndPagibigNumberAndPhilhealthNumberAndDistinguishingMarksToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :pagibig_number, :string
    add_column :crews, :philhealth_number, :string
    add_column :crews, :distinguishing_marks, :string
  end
end
