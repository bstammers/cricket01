class ChangeBallsFacedTypeInBatters < ActiveRecord::Migration
  def change
    change_column :batters, :balls_faced, :integer
  end
end
