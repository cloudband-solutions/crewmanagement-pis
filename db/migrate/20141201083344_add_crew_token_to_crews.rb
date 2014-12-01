class AddCrewTokenToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :crew_token, :string
  end
end
