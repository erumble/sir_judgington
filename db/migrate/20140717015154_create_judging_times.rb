class CreateJudgingTimes < ActiveRecord::Migration
  def change
    create_table :judging_times do |t|
      t.string :time
      t.boolean :common, default: false

      t.timestamps
    end
  end
end
