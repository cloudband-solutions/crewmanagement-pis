class AddSignOnToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :sign_on, :date
  end
end
