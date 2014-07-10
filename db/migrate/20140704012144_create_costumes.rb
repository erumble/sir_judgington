class CreateCostumes < ActiveRecord::Migration
  def change
    create_table :costumes do |t|
      t.string :character_name
      t.string :property
      t.references :owner, index: true

      t.timestamps
    end
  end
end
