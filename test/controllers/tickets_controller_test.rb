require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get :index, customer_id: @ticket.customer.id
    assert_response :success
    assert_not_nil assigns(:tickets)
    assert_not_nil assigns(:customer)
  end

  test "should get new" do
    get :new, customer_id: @ticket.customer.id
    assert_response :success
    assert_not_nil assigns(:ticket)
    assert_not_nil assigns(:customer)
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, customer_id: @ticket.customer.id, ticket: { customer_id: @ticket.customer.id, description: @ticket.description, quantity: @ticket.quantity, ticket_date: @ticket.ticket_date }
    end
    
    assert_not_nil assigns(:ticket)
    assert_redirected_to edit_customer_path(assigns(:customer))
  end

  test "should show ticket" do
    get :show, id: @ticket
    assert_response :success
    assert_not_nil assigns(:ticket)
  end

  test "should get edit" do
    get :edit, id: @ticket
    assert_response :success
    assert_not_nil assigns(:ticket)
  end

  test "should update ticket" do
    patch :update, id: @ticket, ticket: { customer_id:@ticket.customer.id, description: @ticket.description, quantity: @ticket.quantity, ticket_date: @ticket.ticket_date }
    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end

    assert_redirected_to customer_tickets_path(assigns(:ticket).customer)
  end
end
