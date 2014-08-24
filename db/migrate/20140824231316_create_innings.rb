class CreateInnings < ActiveRecord::Migration
  def change
    create_table :innings do |t|
      t.integer :inning_no
      t.string :batting_team
      t.string :bowling_team
      t.string :score
      t.references :match, index: true

      t.timestamps
    end
  end
end
