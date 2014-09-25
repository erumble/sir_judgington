class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :common, default: false

      t.timestamps
    end
  end
end
