require './lib/sales_engine'

se = SalesEngine.from_csv({
  :items     => "./data/items.csv",
  :merchants => "./data/merchants.csv",
})
merchant = se.merchants.find_by_id(12334112)
puts se.items.find_all_by_merchant_id(12334112)
