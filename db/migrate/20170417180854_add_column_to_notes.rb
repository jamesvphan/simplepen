class AddColumnToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :notebook_id, :integer 
  end
end
