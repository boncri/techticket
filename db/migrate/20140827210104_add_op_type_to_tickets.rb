class AddOpTypeToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :op_type, :integer
  end
end
