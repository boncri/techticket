class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :description
      t.date :ticket_date
      t.integer :quantity
      t.integer :customer_id

      t.timestamps
    end
  end
end
