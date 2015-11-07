class AddJoinTable < ActiveRecord::Migration
  def change
    create_join_table :images, :ideas do |t|
      # t.index [:image_id, :idea_id]
      # t.index [:idea_id, :image_id]
    end
  end
end
