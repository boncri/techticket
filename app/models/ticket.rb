class Ticket < ActiveRecord::Base
	belongs_to :customer

	validates :description, presence: true
  validates :quantity, numericality: { greater_than: 0 }

	default_scope -> { order(:ticket_date) }

  def balance
    self.quantity * (self.buy ? 1 : -1)
  end
end
