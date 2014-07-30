require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  should validate_presence_of :name

  should have_many :tickets

  test "Customer buys 10 tickets and uses 10 tickets, then must have tickets_balance = 0" do
    c = Customer.create(name: 'Test')
    c.tickets.create(description:'A',quantity: 10, buy: true)
    c.tickets.create(description:'A',quantity:10, buy:false)

    assert_equal 0, c.tickets_balance
  end

  test "Customer buys 20 tickets and uses 15 tickets in different times, then at the end must have tickets_balance = 5" do
    c = Customer.create(name: 'Test')
    c.tickets.create(description:'A',quantity: 10, buy: true)
    c.tickets.create(description:'A',quantity:5, buy:false)
    c.tickets.create(description:'A',quantity:5, buy:true)
    c.tickets.create(description:'A',quantity:10, buy:false)
    c.tickets.create(description:'A',quantity:5, buy:true)

    assert_equal 5, c.tickets_balance
  end
end
