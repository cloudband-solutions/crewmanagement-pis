class AddPriorityToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :priority, :integer
  end
end
