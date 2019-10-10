class Createusers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username
      t.text :email
      t.string :password_digest 
    end 
  end
end