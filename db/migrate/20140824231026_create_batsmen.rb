class CreateBatsmen < ActiveRecord::Migration
  def change
    create_table :batsmen do |t|
      t.integer :runs
      t.integer :balls_faced
      t.integer :fours
      t.integer :sixes
      t.string :how_out
      t.string :ball_history
      t.references :inning, index: true

      t.timestamps
    end
  end
end
