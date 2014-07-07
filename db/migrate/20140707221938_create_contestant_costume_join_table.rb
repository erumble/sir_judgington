class CreateContestantCostumeJoinTable < ActiveRecord::Migration
  def change
    create_join_table :contestants, :costumes do |t|
      # t.index [:contestant_id, :costume_id]
      t.index [:costume_id, :contestant_id], unique: true
    end
  end
end
