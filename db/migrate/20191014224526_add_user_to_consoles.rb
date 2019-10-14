class AddUserToConsoles < ActiveRecord::Migration
  def change
    add_column :consoles, :user_id, :integer
  end
end
