class FixColumnName < ActiveRecord::Migration
  def change

    rename_column :statuses, :status, :description
  end
end
