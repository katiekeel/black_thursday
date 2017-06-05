require_relative 'invoice_item_repository'

binding.pry

# se = SalesEngine.from_csv({
#   :items => "./data/items.csv",
#   :merchants => "./data/merchants.csv",
#   :invoices => "./data/invoices.csv",
#   :invoice_items => "./data/invoice_items.csv",
#   :transactions => "./data/transactions.csv",
#   :customers => "./data/customers.csv"
# })


invoice_item_repo = InvoiceItemRepository.new(sales_engine = nil).from_csv("./data/invoice_items.csv")
