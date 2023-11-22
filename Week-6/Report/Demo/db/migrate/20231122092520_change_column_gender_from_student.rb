class ChangeColumnGenderFromStudent < ActiveRecord::Migration[7.1]
  def change
    change_column :students, :gender, :integer
  end
end
