require 'bigdecimal'
require 'bigdecimal/util'

class Item

  attr_reader :id,
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
    @unit_price = create_unit_price(item_hash[:unit_price])
    @merchant_id = item_hash[:merchant_id].to_i
    @created_at = item_hash[:created_at]
    @updated_at = item_hash[:updated_at]
  end


  def create_unit_price(unit_price)
    unless unit_price.nil?
      @unit_price = BigDecimal.new(unit_price) / 100
    end
  end

  def unit_price_to_dollars
    @unit_price.to_f
  end

  def merchant
    @item_repository.merchant(@merchant_id)
  end
end
