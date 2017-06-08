require_relative 'sales_engine'
require 'date'
require 'bigdecimal'


class SalesAnalyst
  attr_reader :sales_engine

  def initialize(sales_engine)
    @sales_engine = sales_engine
  end

  def average_items_per_merchant
    avg_ary = merchant_average_array
    average =(avg_ary.reduce(0){|sum,length|sum += length})/avg_ary.length.to_f
    average = average.round(2)
    average
  end

  def average_items_per_merchant_standard_deviation
    standard_deviation
  end

  def standard_deviation
    avg_ary = merchant_average_array
    average = average_items_per_merchant
    squares = avg_ary.map{|num| (num-average)**2}
    standard_dev = Math.sqrt((squares.reduce(:+))/(squares.length-1))
    standard_dev.round(2)
  end

  def average_item_price_for_merchant(merchant_id)
    merchant = @sales_engine.merchants.find_by_id(merchant_id)
    x = merchant.items
    y = x.map{|item| item.unit_price}
    average_price = (y.reduce(:+)/y.length)
    average_price = BigDecimal.new(average_price).round(2)
  end

  def average_average_price_per_merchant
    avg_ary = []
    @sales_engine.merchants.collection.each do |merchant|
      id = merchant.id
      avg_ary << average_item_price_for_merchant(id)
    end
    average_average = (avg_ary.reduce(:+)/avg_ary.length)
    average_average = BigDecimal.new(average_average).round(2)
  end

  def merchants_with_high_item_count
    average_item_hash = {}
    merchant_array = @sales_engine.merchants.collection
    merchant_array.each do |merchant|
      x = merchant.items
      average_item_hash[merchant] = x.length
    end
    array = []
    stddev = standard_deviation
    average_item_hash.each_pair do |merchant, num|
      if num > (average_items_per_merchant + stddev)
        array << merchant
      end
    end
    array
  end

  def merchant_average_array
    average_array = []
    merchant_array = @sales_engine.merchants.collection
    merchant_array.each do |merchant|
      x = merchant.items
      average_array << x.length
    end
    average_array
  end

  def golden_items
    price_array = make_price_array
    avgprice = (price_array.reduce(:+)/price_array.length)
    squares = price_array.map{|num| (num - avgprice)**2 }
    stddev = Math.sqrt((squares.reduce(:+))/(squares.length - 1))
    golden_items = []
    @sales_engine.items.collection.each do |item|
        if item.unit_price > avgprice + stddev*2
          golden_items << item
        end
    end
    golden_items
  end

  def make_price_array
    price_array = []
    items_array = @sales_engine.items.all
    items_array.each do |item|
      price_array << item.unit_price
    end
    price_array
  end

  def average_invoices_per_merchant
    avg_ary = merchant_invoice_array
    avg = (avg_ary.reduce(0){|sum, length| sum += length})/avg_ary.length.to_f
    avg = avg.round(2)
    avg
  end

  def average_invoices_per_merchant_standard_deviation
    standard_deviation_invoice
  end

  def standard_deviation_invoice
    avg_ary = merchant_invoice_array
    average = average_invoices_per_merchant
    squares = avg_ary.map{|num| (num-average)**2}
    standard_dev = Math.sqrt((squares.reduce(:+))/(squares.length-1))
    standard_dev.round(2)
  end

  def create_item_size_hash
    average_item_hash = {}
    merchant_array = @sales_engine.merchants.collection
    merchant_array.each do |merchant|
      x = merchant.invoices
      average_item_hash[merchant] = x.length
    end
    average_item_hash
  end

  def top_merchants_by_invoice_count
    average_item_hash = create_item_size_hash
    array = []
    stddev = standard_deviation_invoice
    average_item_hash.each_pair do |merchant, num|
      if num > (average_invoices_per_merchant + stddev*2)
        array << merchant
      end
    end
    array
  end

  def bottom_merchants_by_invoice_count
    average_item_hash = create_item_size_hash
    array = []
    stddev = standard_deviation_invoice
    average_item_hash.each_pair do |merchant, num|
      if num < (average_invoices_per_merchant - stddev*2)
        array << merchant
      end
    end
    array
  end

  def merchant_invoice_array
    average_array = []
    merchant_array = @sales_engine.merchants.collection
    merchant_array.each do |merchant|
      x = merchant.invoices
      average_array << x.length
    end
    average_array
  end

  def invoice_status(status)
    array = []
    @sales_engine.invoices.collection.each do |invoice|
      if invoice.status == status
        array << invoice
      end
    end
    length = @sales_engine.invoices.collection.length
    percentage = (BigDecimal.new(array.length) / BigDecimal.new(length))
    percentage = percentage.to_f * 100
    percentage.round(2)
  end

  def top_days_by_invoice_count
    days = []
    @sales_engine.invoices.collection.each do |invoice|
      day = DateTime.strptime(invoice.created_at.to_s, "%Y-%m-%d %H:%M:%S")
      day = day.strftime("%A %Y-%m-%d")
      day = day[0..2]
      days << day
    end
    find_top_days(days)
  end

  def find_top_days(days)
    max = {}
    days.each{|day| max[day] = days.count(day)}
    days = max.values
    average = days.reduce(:+)/days.length
    squares = days.map do |num|
      (num-average)**2
    end
    stddev = Math.sqrt((squares.reduce(:+))/(squares.length-1))
    top_days = []
    max.each_pair do |day, num|
      if num > average + stddev
        top_days << to_day(day)
      end
    end
    top_days
  end

  def to_day(day)
    if day == "Wed"
      day = "Wednesday"
    elsif day == "Sat"
      day = "Saturday"
    elsif day == "Sun"
      day = "Sunday"
    elsif day == "Thu"
      day = "Thursday"
    elsif day == "Tue"
      day = "Tuesday"
    elsif day == "Mon"
      day = "Monday"
    elsif day == "Fri"
      day = "Friday"
    end
    day
  end

  def invoices_shipped_by_date(date)
    @sales_engine.invoices.invoices_shipped_by_date(date)
  end

  def find_all_items_by_invoices(invoice_ids)
    @sales_engine.invoice_items.find_all_items_by_invoices(invoice_ids)
  end

  def total_revenue_by_date(date)
    date = Date.parse(date.to_s)
    invoice_ids = invoices_shipped_by_date(date)
    price_hash = find_all_items_by_invoices(invoice_ids)
    total_revenue = []
    price_hash.each_pair { |price, quantity| total_revenue << price * quantity}
    sum = total_revenue.reduce(:+)
  end

  def merchants_with_only_one_item
    merchant_ids = @sales_engine.items.collection.map{|item| item.merchant_id}
    merchants = merchant_ids.group_by(&:itself)
    merchants = merchants.select{|key, val| val.length == 1}.keys
    @sales_engine.merchants.find_multiple_merchants_by_id(merchants)
  end

  def top_revenue_earners(x=20)
    @sales_engine.merchants.top_revenue_earners(x)
  end

  def pending_invoices
    @sales_engine.invoices.all.select{|invoice| invoice.is_pending? == true}
  end

  def merchants_with_pending_invoices
    invoices = pending_invoices
    merchants = invoices.map{|invoice| invoice.merchant}.uniq
  end

  def merchants_ranked_by_revenue
    @sales_engine.merchants_ranked_by_revenue
  end

  def revenue_by_merchant(merchant_id)
    @sales_engine.revenue_by_merchant(merchant_id)
  end

end
