class RemoveAgeFromCrews < ActiveRecord::Migration
  def change
    remove_column :crews, :age
  end
end
