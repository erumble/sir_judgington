class CreateContestJudgingTimeJoinTable < ActiveRecord::Migration
  def change
    create_join_table :contests, :judging_times do |t|
      t.index [:judging_time_id, :contest_id], unique: true
    end
  end
end
