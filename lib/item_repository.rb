require_relative 'item'
require 'csv'
require_relative 'csv_opener'
require_relative 'sales_items'

class ItemRepository

  include SalesItems

  attr_reader :items

  def initialize(csv_file, sales_engine)
    @sales_engine = sales_engine
    @collection = []
    populate_items_repo(csv_file, "item")
  end

  # def inspect
  #   "#<#{self.class} #{@merchants.size} rows>"
  # end

  def populate_items_repo(csv_file, type)
    @items = CSVOpener.new(csv_file, self, type)
    @items = @items.holder
  end
  #
  # def all
  #   @items
  # end
  # 
  # def find_by_id(id)
  #   find_by_id(@items, id)
  # end

  def find_by_name(name)
    return_value = nil
    @items.each do |item|
      if item.name == name
        return_value = item
      end
    end
    return_value
  end

  def find_all_with_description(description_string)
    description_array = []
    @items.each do |item|
      description_array << item if item.description.include?(description_string)
    end
    description_array
  end

  def find_all_by_price(item_price)
    prices_array = []
    @items.each do |item|
      prices_array << item if item.unit_price_to_dollars == item_price
    end
    prices_array
  end

  def find_all_by_price_in_range(range)
    prices_range_array = []
    @items.each do |item|
      prices_range_array << item if range.include?(item.unit_price_to_dollars)
    end
    prices_range_array
  end

  def find_all_by_merchant_id(input_id)
    by_merchant_id_array = @items.select do |item|
      item.merchant_id == input_id.to_s
    end
    by_merchant_id_array
  end

  def from_sales_engine_by_merchant_id(merchant_id)
    find_all_by_merchant_id(merchant_id)
  end

  def merchant(merchant_id)
    @sales_engine.merchant(merchant_id)
  end

end
