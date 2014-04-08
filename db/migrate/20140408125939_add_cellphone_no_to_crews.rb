class AddCellphoneNoToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :cellphone_no, :string
  end
end
