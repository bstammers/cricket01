class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.string :ground
      t.date :start
      t.date :end
      t.string :competition
      t.string :umpire1
      t.string :umpire2

      t.timestamps
    end
  end
end
