class RemoveBuyFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :buy, :boolean
  end
end
