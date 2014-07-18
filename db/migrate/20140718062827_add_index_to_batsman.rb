class AddIndexToBatsman < ActiveRecord::Migration
  def change
    add_reference :balls, :batsman, index: true
  end
end
