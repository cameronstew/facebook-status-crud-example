class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :number_of_likes
      t.status :belongs_to
    end
  end
end
