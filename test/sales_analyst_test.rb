require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_analyst'
require './lib/sales_engine'

class SalesAnalystTest < Minitest::Test

  def test_sales_analyst_initiates
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    assert_instance_of SalesAnalyst, sa
  end

  def test_sales_engine_still_holds_both_repos
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    merchant_repo = sa.sales_engine.merchants
    assert_instance_of MerchantRepository, merchant_repo
    items_repo = sa.sales_engine.items
    assert_instance_of ItemRepository, items_repo
    invoices_repo = sa.sales_engine.invoices
    assert_instance_of InvoiceRepository, invoices_repo
  end

  def test_merchants_can_still_be_searched_via_merchant_id
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    merchants_array = sa.sales_engine.merchants
    merchant = merchants_array.find_by_id(12334165)
    assert_instance_of Merchant, merchant
  end

  def test_items_can_be_searched_by_id
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    items_array = sa.sales_engine.items
    item = items_array.find_by_id(263405559)
    assert_instance_of Item, item
  end

  def test_merchants_can_still_be_searched_via_merchant_id
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    merchants_array = sa.sales_engine.merchants
    merchant = merchants_array.find_by_id(12334165)
    assert_instance_of Merchant, merchant
  end

  def test_items_can_be_searched_by_id
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    items_array = sa.sales_engine.items
    item = items_array.find_by_id(263405559)
    assert_instance_of Item, item
  end

  def test_invoices_can_be_searched_by_id
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    invoices_array = sa.sales_engine.invoices
    assert_instance_of InvoiceRepository, invoices_array
    invoice = invoices_array.find_by_id(4985)
    assert_instance_of Invoice, invoice
  end

  def test_merchants_can_call_all_items
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    merchants_array = sa.sales_engine.merchants
    merchant = merchants_array.find_by_id(12334165)
    items = merchant.items
    assert_instance_of Array, items
  end

  def test_merchants_can_call_all_invoices
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    merchants_array = sa.sales_engine.merchants
    merchant = merchants_array.find_by_id(12334165)
    invoices = merchant.invoices
    assert_instance_of Array, invoices
  end

  def test_merchants_items_can_be_averaged
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    x = sa.average_items_per_merchant
    assert_equal 2.88, x
  end

  def test_invoices_can_call_merchant_by_id
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    invoices_repo = sa.sales_engine.invoices
    invoice = invoices_repo.find_by_id(4985)
    merchant = invoice.merchant
    assert_instance_of Merchant, merchant
  end

  def test_it_takes_standard_deviation
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.average_items_per_merchant_standard_deviation
    assert_equal 3.26, result
  end

  def test_it_lists_merchants_with_most_items
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.merchants_with_high_item_count
    assert_instance_of Array, result
    assert_instance_of Merchant, result[0]
  end

  def test_it_gives_average_price_for_one_merchant
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.average_item_price_per_merchant(12334165)
    assert_equal 100, result
  end

  def test_golden_items_return_array_with_items
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.golden_items
    assert_instance_of Array, result
    assert_instance_of String, result[0]
  end

  def test_it_can_return_average_invoices
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.average_invoices_per_merchant
    assert_instance_of Float, result
  end

  def test_it_calculates_invoice_standard_deviation
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.average_invoices_per_merchant_standard_deviation
    assert_instance_of Float, result
  end

  def test_it_returns_top_invoiced_merchants
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.top_merchants_by_invoice_count
    assert_instance_of Array, result
    assert_instance_of String, result[0]
  end

  def test_it_returns_array_of_bottom_invoiced_merchants
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.bottom_merchants_by_invoice_count
    assert_equal 4, result.length
  end

  def test_invoice_total_returns_total
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    invoice = se.invoices.find_by_id(20)
    result = invoice.total
    assert_instance_of BigDecimal, result
  end

  def test_status_percentages_all_work
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.invoice_status(:pending)
    result2 = sa.invoice_status(:shipped)
    result3 = sa.invoice_status(:returned)
    assert_equal 29.55, result
    assert_equal 56.95, result2
    assert_equal 13.5, result3
  end

  def test_merchant_invoice_array_returns_array
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    array = sa.merchant_invoice_array
    assert_instance_of Array, array
  end

  def test_create_item_size_hash_works
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.create_item_size_hash
    assert_instance_of Hash, result
  end

  def test_merchant_average_array_returns_array
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.merchant_average_array
    assert_instance_of Array, result
    assert_instance_of Fixnum, result[0]
  end

  def test_average_average_price_per_merchant
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.average_average_price_per_merchant
    assert_instance_of BigDecimal, result
  end

  def test_make_price_array_works
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.make_price_array
    assert_instance_of Array, result
    assert_instance_of BigDecimal, result[0]
  end

  def test_average_invoices_per_merchant_stand_dev_returns_stddev
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.average_invoices_per_merchant_standard_deviation
    assert_instance_of Float, result
  end

  def test_total_revenue_by_date
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    revenue = sa.total_revenue_by_date("2017-01-01")
    revenue1 = sa.total_revenue_by_date("2009-02-07")
    assert_instance_of BigDecimal, revenue1
    assert_equal 21067.77, revenue1.to_f
  end

  def test_merchants_with_only_one_item
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.merchants_with_only_one_item
    assert_instance_of Merchant, result[0]
    assert_equal 243, result.length
  end

  def test_it_puts_out_top_revenue_earners
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.top_revenue_earners(10)
    assert_equal 10, result.length
    assert_equal Merchant, result[0].class
    assert_equal 12334634, result.first.id
    assert_equal 12335747, result.last.id
  end

  def test_top_rev_automatically_returns_20_without_argument
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.top_revenue_earners
    first = result.first
    last = result.last
    assert_equal 20, result.length
    assert_equal 12334634, first.id
    assert_equal 12334159, last.id
  end

  def test_pending_invoices
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.merchants_with_pending_invoices
    assert_equal 468, result.length
  end

  def test_invoice_total_returns_total
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    invoice = se.invoices.find_by_id(1)
    result = invoice.total
    assert_instance_of BigDecimal, result
    assert_equal 21067.77, result
  end

  def test_merchants_with_only_one_invoice_in_month
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.merchants_with_only_one_item_registered_in_month("March")
    assert_equal result.length, 21
    assert_instance_of Merchant, result.first
  end

  def test_revenue_by_merchant
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.revenue_by_merchant(12334194)
    result2 = sa.revenue_by_merchant(12335747)
    result3 = sa.revenue_by_merchant(12334960)
    assert_instance_of BigDecimal, result
    assert result2 > result3
  end

  def test_merchants_ranked_by_revenue
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    results = sa.merchants_ranked_by_revenue
    first = results.first
    last = results.last
    assert_equal 12334634, first.id
    assert_equal 12336175, last.id
  end

  def test_status_percentages_all_work
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.invoice_status(:pending)
    result2 = sa.invoice_status(:shipped)
    result3 = sa.invoice_status(:returned)
    assert_equal 29.55, result
    assert_equal 56.95, result2
    assert_equal 13.5, result3
  end

  def test_to_day_puts_out_appropriate_day
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    day = sa.to_day("Wed")
    assert_equal "Wednesday", day
  end

  def test_top_days_by_invoice_count
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    top_days = sa.top_days_by_invoice_count
    assert_instance_of Array, top_days
  end

  def test_total_revenue_by_date
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    revenue = sa.total_revenue_by_date("2009-02-07")
    assert_equal revenue, 21067.77
  end

  def test_it_puts_out_top_revenue_earners
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.top_revenue_earners(10)
    assert_equal 10, result.length
    assert_equal Merchant, result[0].class
    assert_equal 12334634, result.first.id
    assert_equal 12335747, result.last.id
  end

  def test_merchants_with_pending_invoices
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.merchants_with_pending_invoices
    assert_equal result.length, 468
    assert_instance_of Merchant, result.first
  end

  def test_merchants_with_only_one_item
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    single_item_merchants = sa.merchants_with_only_one_item
    assert_equal single_item_merchants.length, 243
    assert_instance_of Merchant, single_item_merchants.first
  end

  def test_most_sold_item_for_merchant
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.most_sold_item_for_merchant(12334189)
    assert_instance_of Item, result.first
  end

  def test_best_item_for_merchant
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    result = sa.best_item_for_merchant(12334189)
    assert_instance_of Item, result
    assert_equal result.id, 263516130
  end

  def test_total_revenue_works
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    sa = SalesAnalyst.new(se)
    merchant1 = sa.sales_engine.merchants.total_revenue(12334634)
    merchant2 = sa.sales_engine.merchants.total_revenue(12335747)
    merchant3 = sa.sales_engine.merchants.total_revenue(12334960)
  end
end
