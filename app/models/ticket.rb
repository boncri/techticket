class Ticket < ActiveRecord::Base
	belongs_to :customer

  after_initialize :set_defaults

	validates :description, presence: true
  validates :quantity, numericality: { greater_than: 0 }

	default_scope -> { order(:ticket_date) }

  def balance
    self.quantity * (self.buy ? 1 : -1)
  end

  private
  def set_defaults
    self.ticket_date ||= Date.today
    self.quantity ||= 0
    self.buy ||= false
  end
end
