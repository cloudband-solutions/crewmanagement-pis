class AddStatusToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :status, :string
  end
end
