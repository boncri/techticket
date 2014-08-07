class TicketsController < ApplicationController
  include Inliner

  before_action :set_customer, only: [:index, :new, :create]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  inline_object :ticket, :customer

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = @customer ? @customer.tickets : Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = @customer ? @customer.tickets.build : Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = @customer.tickets.create(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to edit_customer_path(@customer), notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to customer_tickets_url(@ticket.customer), notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:description, :ticket_date, :quantity, :customer_id, :quantity_abs, :buy)
    end
end
