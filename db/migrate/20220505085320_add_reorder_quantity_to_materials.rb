class AddReorderQuantityToMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :materials, :reorder_quantity, :integer
  end
end
