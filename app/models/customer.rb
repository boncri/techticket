class Customer < ActiveRecord::Base
	has_many :tickets

	validates :name, presence: true

	def tickets_balance
		Ticket.where(customer: self).sum(:quantity)
	end
end
