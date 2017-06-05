require 'bigdecimal'
require 'bigdecimal/util'

class Item
  attr_reader :item_repository,
              :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize(item_hash, item_repo)
    @item_repository = item_repo
    @id = item_hash[:id].to_i
    @name = item_hash[:name]
    @description = item_hash[:description]
    @unit_price = BigDecimal.new(item_hash[:unit_price]) / 100 unless item_hash[:unit_price] == nil
    @merchant_id = item_hash[:merchant_id].to_i
    @created_at = item_hash[:created_at]
    @updated_at = item_hash[:updated_at]
  end

  def unit_price_to_dollars
    @unit_price.to_f
  end

  def merchant
    @item_repository.merchant(@merchant_id)
  end
end
