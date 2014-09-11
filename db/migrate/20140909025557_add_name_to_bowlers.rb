class AddNameToBowlers < ActiveRecord::Migration
  def change
    add_column :bowlers, :name, :string
  end
end
