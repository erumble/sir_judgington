class CreateCosplays < ActiveRecord::Migration
  def change
    create_table :cosplays do |t|
      t.references :owner, index: true
      t.references :character, index: true
      t.references :entry, index: true

      t.timestamps
    end
  end
end
