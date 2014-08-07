class Customer < ActiveRecord::Base
	has_many :tickets, dependent: :destroy

	validates :name, presence: true

	def tickets_balance
		self.tickets.inject(0) { |sum, t| sum + t.balance }
  end

  accepts_nested_attributes_for :tickets, allow_destroy: true
end
