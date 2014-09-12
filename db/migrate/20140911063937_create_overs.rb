class CreateOvers < ActiveRecord::Migration
  def change
    create_table :overs do |t|
      t.string :bowler_name
      t.string :bowler_over
      t.integer :runs
      t.integer :wides
      t.integer :no_balls
      t.integer :byes
      t.integer :leg_byes
      t.integer :wickets
      t.string :score
      t.references :inning, index: true

      t.timestamps
    end
  end
end
