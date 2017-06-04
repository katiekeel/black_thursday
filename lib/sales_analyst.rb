require_relative 'sales_engine'
require 'bigdecimal'


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

  def average_invoices_per_merchant
    average_array = merchant_invoice_array
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
      if num > (average_items_per_merchant + stddev)
        array << merchant
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

  def average_invoices_per_merchant
    average_array = merchant_invoice_array
    average = (average_array.reduce(0){|sum, length| sum += length})/average_array.length.to_f
    average = average.round(2)
    average
  end

  def average_invoices_per_merchant_standard_deviation
    standard_deviation_invoice
  end

  def standard_deviation_invoice
    average_array = merchant_invoice_array
    average = average_invoices_per_merchant
    temporary_math_array = average_array.map{|num| (num-average)**2}
    standard_dev = Math.sqrt((temporary_math_array.reduce(:+))/(temporary_math_array.length-1))
    standard_dev.round(2)
  end

  def top_merchants_by_invoice_count
    average_item_hash = {}
    merchant_array = @sales_engine.merchants.merchants
    merchant_array.each do |merchant|
      x = merchant.invoices
      average_item_hash[x.length] = merchant
    end
    array = []
    stddev = standard_deviation_invoice
    average_item_hash.each_pair do |num, merchant|
      if num > (average_invoices_per_merchant + stddev*2)
        array << merchant.name
      end
    end
    array
  end

  def bottom_merchants_by_invoice_count
    average_item_hash = {}
    merchant_array = @sales_engine.merchants.merchants
    merchant_array.each do |merchant|
      x = merchant.invoices
      average_item_hash[x.length] = merchant
    end
    array = []
    stddev = standard_deviation_invoice
    average_item_hash.each_pair do |num, merchant|
      if num < (average_invoices_per_merchant + stddev*2)
        array << merchant.name
      end
    end
    array
  end

  def merchant_invoice_array
    average_array = []
    merchant_array = @sales_engine.merchants.merchants
    merchant_array.each do |merchant|
      x = merchant.invoices
      average_array << x.length
    end
    average_array
  end

  def invoice_status(status)
    array = []
    @sales_engine.invoices.invoices.each do |invoice|
      if invoice.status == status.to_s
        array << invoice
      end
    end
    percentage = (BigDecimal.new(array.length) / BigDecimal.new(@sales_engine.invoices.invoices.length))
    percentage = percentage.to_f * 100
    percentage.round(2)
  end

  def top_days_by_invoice_count
    days = []
    @sales_engine.invoices.invoices.each do |invoice|
      day = DateTime.parse(invoice.created_at)
      day = day.strftime("%a %d %b %Y")
      day = day[0..2]
      days << day
    end
    max = {}
    days.each{|day| max[day] = days.count(day)}
    days = max.values
    average = days.reduce(:+)/days.length
    temporary_math_array = days.map do |num|
      (num-average)**2
    end
    stddev = Math.sqrt((temporary_math_array.reduce(:+))/(temporary_math_array.length-1))
    top_days = []
    max.each_pair do |day, num|
      if num > average + stddev
        top_days << to_day(day) #to_day method
      end
    end
    top_days
  end

  def to_day(day)
    if day = "Wed"
      day = "Wednesday"
    elsif day = "Sat"
      day = "Saturday"
    elsif day = "Sun"
      day = "Sunday"
    elsif day = "Thu"
      day = "Thursday"
    elsif day = "Tue"
      day = "Tuesday"
    elsif day = "Mon"
      day = "Monday"
    elsif day = "Fri"
      day = "Friday"
    end
    day
  end


end
