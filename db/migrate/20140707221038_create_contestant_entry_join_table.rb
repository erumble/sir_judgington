class CreateContestantEntryJoinTable < ActiveRecord::Migration
  def change
    create_join_table :contestants, :entries do |t|
      # t.index [:contestant_id, :entry_id]
      t.index [:entry_id, :contestant_id], unique: true
    end
  end
end
