class Ticket < ActiveRecord::Base
	belongs_to :customer

	validates :description, presence: true	

	default_scope -> { order(:ticket_date) }
end
