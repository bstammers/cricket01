class CreateMatchOvers < ActiveRecord::Migration
  def change
    create_table :match_overs do |t|
      t.integer :runs
      t.integer :wides
      t.integer :no_balls
      t.integer :byes
      t.integer :leg_byes
      t.integer :wickets
      t.string :score
      t.references :match, index: true

      t.timestamps
    end
  end
end
