class CreateCategoryEntryJoinTable < ActiveRecord::Migration
  def change
    create_join_table :categories, :entries do |t|
      # t.index [:category_id, :entry_id]
      t.index [:entry_id, :category_id], unique: true
    end
  end
end
