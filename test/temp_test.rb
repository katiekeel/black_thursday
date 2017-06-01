require './lib/sales_engine'

se = SalesEngine.from_csv({
  :items     => "./data/items.csv",
  :merchants => "./data/merchants.csv",
})
item = se.items.find_by_id(263395237)
binding.pry
item.merchant
