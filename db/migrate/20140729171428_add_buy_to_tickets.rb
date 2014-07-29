class AddBuyToTickets < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      t.boolean :buy
    end
  end
end
