json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :description, :ticket_date, :quantity, :customer_id
  json.url ticket_url(ticket, format: :json)
end
