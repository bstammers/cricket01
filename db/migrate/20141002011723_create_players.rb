class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :display_name
      t.string :team
      t.references :match

      t.timestamps
    end
  end
end
