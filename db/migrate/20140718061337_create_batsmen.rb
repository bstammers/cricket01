class CreateBatsmen < ActiveRecord::Migration
  def change
    create_table :batsmen do |t|
      t.string :name
      t.integer :balls_faced
      t.integer :fours
      t.integer :sixes
      t.references :inning, index: true

      t.timestamps
    end
  end
end
