class Createconsoles < ActiveRecord::Migration
  def change
    create_table :consoles do |t|
      t.text :name
      t.text :description
      t.date :release_date
      t.integer :user_id
    end 
  end
end