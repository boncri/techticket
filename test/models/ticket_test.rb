require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  should validate_presence_of :description

  should validate_numericality_of(:quantity).is_greater_than(0)

  should belong_to :customer

  test "Ticket with quantity > 1 and buy=true must have balance = 1" do
    t = Ticket.create(description:'A', quantity: 1, buy:true)
    assert_equal 1, t.balance
  end

  test "Ticket with quantity > 1 and buy=false must have balance = -1" do
    t = Ticket.create(description:'A', quantity: 1, buy:false)
    assert_equal -1, t.balance
  end

  test "tickets must be ordered by date" do
    Ticket.create(description:'A', quantity:1, ticket_date:Time.now)
    Ticket.create(description:'B', quantity:1, ticket_date:Time.now - 10.days)

    assert_equal 10, (Ticket.last.ticket_date - Ticket.first.ticket_date)
    assert_equal 'A', Ticket.last.description
  end
end
