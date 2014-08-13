class AddRankIdToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :rank_id, :integer
  end
end
