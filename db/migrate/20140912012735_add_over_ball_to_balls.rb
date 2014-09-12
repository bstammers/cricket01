class AddOverBallToBalls < ActiveRecord::Migration
  def change
    add_column :balls, :over_ball, :string
    add_index :balls, :over_ball
  end
end
