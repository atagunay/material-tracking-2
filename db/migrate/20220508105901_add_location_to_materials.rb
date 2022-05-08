class AddLocationToMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :materials, :location, :string, null: false, default:"unknown"

  end
end
