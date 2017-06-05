require './lib/sales_engine'
require 'pry'

invoice_item_repo = InvoiceItemRepository.new("./data/invoice_items.csv", sales_engine = nil)
invoice_item = invoice_item_repo.find_by_id(1)
binding.pry
puts invoice_item.created_at
