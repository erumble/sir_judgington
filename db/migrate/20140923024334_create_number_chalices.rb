class CreateNumberChalices < ActiveRecord::Migration
  def change
    create_table :number_chalices do |t|
      t.integer :exhibition, default: 0
      t.integer :hot_or_bulky, default: 0
      t.integer :regular, default: 0
      t.integer :lock_version
      t.references :contest, index: true

      t.timestamps
    end
  end
end
