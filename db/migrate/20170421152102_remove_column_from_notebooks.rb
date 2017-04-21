class RemoveColumnFromNotebooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :notebooks, :description, :string
  end
end
