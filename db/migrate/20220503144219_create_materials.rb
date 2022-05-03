class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :explanation
      t.integer :quantity

      t.timestamps
    end
  end
end
