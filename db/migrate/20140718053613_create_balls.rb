class CreateBalls < ActiveRecord::Migration
  def change
    create_table :balls do |t|
      t.integer :runs
      t.string :how_out
      t.string :caught_by
      t.string :striker
      t.string :non_striker
      t.string :sundries_type
      t.integer :sundries_amt
      t.string :shot_location
      t.references :bowler, index: true
      t.references :over, index: true

      t.timestamps
    end
  end
end
