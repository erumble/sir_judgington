class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :skill_level, default: 0
      t.boolean :hot_or_bulky, default: false
      t.string :group_name
      t.references :contest, index: true
      t.integer :handler_count, default: 0
      t.references :judging_time, index: true
      t.string :entry_num

      t.timestamps
    end
  end
end
