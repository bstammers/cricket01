class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.string :ground
      t.date :start_date
      t.string :end_date
      t.string :competition
      t.string :umpire1
      t.string :umpire2
      t.string :scorer1
      t.string :scorer2

      t.timestamps
    end
  end
end
