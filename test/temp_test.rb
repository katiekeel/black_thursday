require './lib/item_repository'

item_repo = ItemRepository.new("./data/items.csv", sales_engine = nil)

item = item_repo.find_by_id(263395237)
p item.created_at
day = DateTime.parse(item.created_at)
p day.strftime('%a %d %b %Y')
