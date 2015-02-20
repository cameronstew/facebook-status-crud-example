class AddUserNameToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :user_name, :string
  end
end
