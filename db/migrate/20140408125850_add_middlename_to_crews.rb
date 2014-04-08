class AddMiddlenameToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :middlename, :string
  end
end
