class CreateStatus < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :status
      t.users :belongs_to
    end
  end
end
