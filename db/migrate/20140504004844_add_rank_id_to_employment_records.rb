class AddRankIdToEmploymentRecords < ActiveRecord::Migration
  def change
    remove_column :employment_records, :rank
    add_column :employment_records, :rank_id, :integer
  end
end
