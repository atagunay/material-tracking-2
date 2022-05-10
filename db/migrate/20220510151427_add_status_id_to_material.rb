class AddStatusIdToMaterial < ActiveRecord::Migration[7.0]
  def change
    add_column :materials, :status_id, :integer, default: 0
    add_index :materials, :status_id

  end
end
