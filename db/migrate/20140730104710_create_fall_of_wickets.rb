class CreateFallOfWickets < ActiveRecord::Migration
  def change
    create_table :fall_of_wickets do |t|
      t.integer :wicket
      t.string :batsman_out
      t.string :batsman_not_out
      t.integer :partnership
      t.references :inning, index: true

      t.timestamps
    end
  end
end
