class AddNameAndBallHistoryToBatsman < ActiveRecord::Migration
  def change
    add_column :batsmen, :name, :string
  end
end
