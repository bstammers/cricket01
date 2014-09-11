class CreateBatters < ActiveRecord::Migration
  def change
    create_table :batters do |t|
      t.string :name
      t.integer :runs
      t.string :balls_faced
      t.integer :fours
      t.integer :sixes
      t.integer :how_out
      t.string :bowler
      t.string :ball_history
      t.references :inning, index: true

      t.timestamps
    end
  end
end
