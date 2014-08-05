class CreateBatsmen < ActiveRecord::Migration
  def change
    create_table :batsmen do |t|
      t.integer :runs
      t.integer :balls_faced
      t.integer :fours
      t.integer :sixes
      t.integer :how_out
      t.references :inning, index: true

      t.timestamps
    end
  end
end
