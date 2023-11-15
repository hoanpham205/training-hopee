class CreatePictures < ActiveRecord::Migration[7.1]
  def change
    create_table :pictures do |t|
      t.belongs_to :account 
      t.string :name 
      t.timestamps
    end
  end
end
