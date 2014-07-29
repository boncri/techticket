require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should validate_presence_of :name

  should have_many :tickets

  test "Customer buys 10 tickets, then use 10 tickets, must have tickets_balance = 0" do
    c = Customer.create(name: 'Test')
    c.tickets.create(description:'A',quantity: 10, buy: true)
    c.tickets.create(description:'A',quantity:10, buy:false)

    assert_equal 0, c.tickets_balance
  end

  test "Customer buys 10 tickets, then use 5 tickets, must have tickets_balance = 5" do
    c = Customer.create(name: 'Test')
    c.tickets.create(description:'A',quantity: 10, buy: true)
    c.tickets.create(description:'A',quantity:5, buy:false)

    assert_equal 5, c.tickets_balance
  end
end
