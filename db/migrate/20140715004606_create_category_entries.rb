class CreateCategoryEntries < ActiveRecord::Migration
  def change
    create_table :category_entries do |t|
      t.references :category, index: true
      t.references :entry, index: true
      t.index [:entry_id, :category_id], unique: true

      t.timestamps
    end
  end
end
