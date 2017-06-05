require './lib/sales_engine'
require 'pry'

se = SalesEngine.from_csv({
  :items => "./data/items.csv",
  :merchants => "./data/merchants.csv",
  :invoices => "./data/invoices.csv",
  :invoice_items => "./data/invoice_items.csv",
  :transactions => "./data/transactions.csv",
  :customers => "./data/customers.csv"
})

invoice = se.invoices.find_by_id(1)
puts invoice.is_paid_in_full?
