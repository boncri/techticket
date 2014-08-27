class Ticket < ActiveRecord::Base
  extend Enumerize

	belongs_to :customer

  after_initialize :set_defaults

	validates :description, presence: true
  validates :quantity, numericality: { greater_than: 0 }, presence: true
  validates :op_type, presence: true

  enumerize :op_type, in: {use: 1, buy: 2}

	default_scope -> { order(:ticket_date) }

  def buy
    self.op_type.buy?
  end

  def balance
    self.quantity * (self.buy ? 1 : -1)
  end

  private
  def set_defaults
    self.ticket_date ||= Date.today
    self.quantity ||= 0
    self.op_type ||= :use
  end
end
