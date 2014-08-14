class AddDateOfPromotionToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :date_of_promotion, :date
  end
end
