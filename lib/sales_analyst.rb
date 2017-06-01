require './lib/sales_engine'


class SalesAnalyst
  attr_reader :sales_engine

  def initialize(sales_engine)
    @sales_engine = sales_engine
  end

  def average_items_per_merchant
    average_array = merchant_average_array
    average = (average_array.reduce(0){|sum, length| sum += length})/average_array.length.to_f
    average = average.round(2)
    average
  end

  def average_items_per_merchant_standard_deviation
    standard_deviation
  end

  def standard_deviation
    average_array = merchant_average_array
    average = average_items_per_merchant
    temporary_math_array = average_array.map{|num| (num-average)**2}
    standard_dev = Math.sqrt((temporary_math_array.reduce(:+))/(temporary_math_array.length-1))
    standard_dev.round(2)
  end

  def average_item_price_per_merchant(merchant_id)
    merchant = @sales_engine.merchants.find_by_id(merchant_id)
    x = merchant.items
    y = x.map{|item| item.unit_price}
    average_price = (y.reduce(:+)/y.length).to_f/100
  end

  def average_average_price_per_merchant
    average_array = []
    @sales_engine.merchants.merchants.each do |merchant|
      id = merchant.id
      average_array << average_item_price_per_merchant(id)
    end
    average_average = (average_array.reduce(:+)/average_array.length).to_f/100
  end

  def merchants_with_high_item_count
    average_item_hash = {}
    merchant_array = @sales_engine.merchants.merchants
    merchant_array.each do |merchant|
      x = merchant.items
      average_item_hash[x.length] = merchant
    end
    array = []
    stddev = standard_deviation
    average_item_hash.each_pair do |num, merchant|
      if num > stddev
        array << merchant.name
      end
    end
    array
  end

  def merchant_average_array
    average_array = []
    merchant_array = @sales_engine.merchants.merchants
    merchant_array.each do |merchant|
      x = merchant.items
      average_array << x.length
    end
    average_array
  end

  def golden_items
    price_array = []
    items_array = @sales_engine.items.items
    items_array.each do |item|
      price_array << item.unit_price
    end
    avgprice = (price_array.reduce(:+)/price_array.length)
    temporary_math_array = price_array.map{|num| (num - avgprice)**2 }
    stddev = Math.sqrt((temporary_math_array.reduce(:+))/(temporary_math_array.length - 1))
    golden_items = []
    @sales_engine.items.items.each do |item|
        if item.unit_price > stddev
          golden_items << item.name
        end
    end
    golden_items
  end
end
#
se = SalesEngine.from_csv({:items => "./data/items.csv", :merchants => "./data/merchants.csv"})
sa = SalesAnalyst.new(se)
sa.golden_items
# p sa.average_item_price_per_merchant(12334165)
# p sa.average_average_price_per_merchant
# p sa.golden_items
