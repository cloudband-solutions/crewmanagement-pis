class DeleteSurnameFieldFromCrews < ActiveRecord::Migration
  def change
  	remove_column :Crews, :surname
  end
end
