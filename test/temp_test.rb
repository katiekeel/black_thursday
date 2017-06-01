require './lib/sales_engine'
<<<<<<< HEAD
=======
se = SalesEngine.from_csv({
  :items     => "./data/items.csv",
  :merchants => "./data/merchants.csv",
})

merchant = se.merchants.find_by_id(12334112)
merchant = merchant.first
item = merchant.items.first
p item.name
>>>>>>> sales_analyst
