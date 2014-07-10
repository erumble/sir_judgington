class CreateContestantCostumeJoinTable < ActiveRecord::Migration
  def change
    create_join_table :contestants, :costumes do |t|
      t.index [:costume_id, :contestant_id], unique: true
    end
  end
end
