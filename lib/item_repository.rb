require_relative 'item'
require 'csv'
require_relative 'csv_opener'
require_relative 'sales_items'

class ItemRepository

  include SalesItems

  attr_reader :collection

  def initialize(csv_file, sales_engine)
    @sales_engine = sales_engine
    @collection = []
    populate_items_repo(csv_file, "item")
  end

  # def inspect
  #   "#<#{self.class} #{@merchants.size} rows>"
  # end

  def populate_items_repo(csv_file, type)
    @collection = CSVOpener.new(csv_file, self, type)
    @collection = @collection.holder
  end

  def find_all_with_description(description_string)
    description_array = @collection.select do |item|
      item.description.include?(description_string)
    end
    description_array
  end

  def find_all_by_price(item_price)
    prices_array = @collection.select do |item|
      item.unit_price_to_dollars == item_price
    end
    prices_array
  end

  def find_all_by_price_in_range(range)
    prices_range_array = @collection.select do |item|
      range.include?(item.unit_price_to_dollars)
    end
    prices_range_array
  end

  def from_sales_engine_by_merchant_id(merchant_id)
    find_all_by_merchant_id(merchant_id)
  end

  def merchant(merchant_id)
    @sales_engine.merchant(merchant_id)
  end

end
