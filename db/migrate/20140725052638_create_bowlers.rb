class CreateBowlers < ActiveRecord::Migration
  def change
    create_table :bowlers do |t|
      t.string :name
      t.integer :overs
      t.integer :runs
      t.integer :wickets
      t.integer :wides
      t.integer :no_balls
      t.integer :maidens
      t.references :inning, index: true

      t.timestamps
    end
  end
end
