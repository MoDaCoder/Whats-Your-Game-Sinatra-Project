class Creategames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :title
      t.text :description
      t.date :release_date
      t.integer :console_id
    end 
  end
end