class AddGradeToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :grade, :string
  end
end
