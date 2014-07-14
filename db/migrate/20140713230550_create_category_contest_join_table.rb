class CreateCategoryContestJoinTable < ActiveRecord::Migration
  def change
    create_join_table :categories, :contests do |t|
      t.index [:contest_id, :category_id], unique: true
    end
  end
end
