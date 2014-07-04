class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :contest_date
      t.integer :skill_level, default: 0
      t.boolean :hot_or_bulky
      t.string :group_name

      t.timestamps
    end
  end
end
