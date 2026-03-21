class RenameAssignedToInTickets < ActiveRecord::Migration[8.1]
  def change
    rename_column :tickets, :assigned_to, :assigned_to_id
  end
end
