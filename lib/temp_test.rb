require_relative 'item_repository'

item_repo = ItemRepository.new('./data/items.csv', sales_engine = nil)
item_repo.find_by_id(263550472)
