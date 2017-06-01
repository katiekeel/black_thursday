require './lib/merchant_repository'
require './lib/item_repository'

class SalesEngine

  attr_reader :merchants, :items

  def initialize(item_merchant_hash)
    @items = ItemRepository.new(item_merchant_hash[:items], self)
    @merchants = MerchantRepository.new(item_merchant_hash[:merchants], self)
  end

  def self.from_csv(item_merchant_hash)
    se = SalesEngine.new(item_merchant_hash)
  end

  def sales_engine_items(merchant_id)
    @items.find_all_by_merchant_id(merchant_id)
  end

  def merchant(item_id)
    @merchants.merchant(item_id)
  end
end
