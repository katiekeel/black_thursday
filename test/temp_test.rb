require './lib/sales_engine'
require './lib/sales_analyst'
require 'pry'

se = SalesEngine.from_csv({
  :items => "./data/items.csv",
  :merchants => "./data/merchants.csv",
  :invoices => "./data/invoices.csv",
  :invoice_items => "./data/invoice_items.csv",
  :transactions => "./data/transactions.csv",
  :customers => "./data/customers.csv"
})

sa = SalesAnalyst.new(se)

puts sa.most_sold_item_for_merchant(12334189)
