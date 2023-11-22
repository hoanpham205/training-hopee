class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name 
      t.string :email
      t.boolean :gender
      t.date :date  
      t.string :address 
      t.integer :phone 
      t.timestamps
    end
  end
end
