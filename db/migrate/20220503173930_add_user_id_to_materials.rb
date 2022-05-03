class AddUserIdToMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :materials, :user_id, :integer
    add_index :materials, :user_id
  end
end
