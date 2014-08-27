require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  should validate_presence_of :description

  should validate_presence_of(:quantity)
  should validate_numericality_of(:quantity).is_greater_than(0)

  should belong_to :customer

  test "Ticket with quantity > 1 and op_type=buy must have balance = 1" do
    t = Ticket.create(description:'A', quantity: 1, op_type: :buy)
    assert_equal 1, t.balance
  end

  test "Ticket with quantity > 1 and op_type=use must have balance = -1" do
    t = Ticket.create(description:'A', quantity: 1, op_type: :use)
    assert_equal -1, t.balance
  end

  test "tickets must be ordered by date" do
    Ticket.create(description:'A', quantity:1, ticket_date:Time.now)
    Ticket.create(description:'B', quantity:1, ticket_date:Time.now - 10000.days)

    assert_equal 10000, (Ticket.last.ticket_date - Ticket.first.ticket_date).to_i
    assert_equal 'A', Ticket.last.description
  end
end
