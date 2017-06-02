require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_analyst'
require './lib/sales_engine'

class SalesAnalystTest < Minitest::Test

  def test_sales_analyst_initiates
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    assert_instance_of SalesAnalyst, sa
  end

  def test_sales_engine_still_holds_both_repos
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    merchant_repo = sa.sales_engine.merchants
    assert_instance_of MerchantRepository, merchant_repo
    items_repo = sa.sales_engine.items
    assert_instance_of ItemRepository, items_repo
    invoices_repo = sa.sales_engine.invoices
    assert_instance_of InvoiceRepository, invoices_repo
  end

  def test_merchants_can_still_be_searched_via_merchant_id
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    merchants_array = sa.sales_engine.merchants
    merchant = merchants_array.find_by_id(12334165)
    assert_instance_of Merchant, merchant
  end

  def test_items_can_be_searched_by_id
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    items_array = sa.sales_engine.items
    item = items_array.find_by_id(263405559)
    assert_instance_of Item, item
  end

  def test_invoices_can_be_searched_by_id
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    invoices_array = sa.sales_engine.invoices
    assert_instance_of InvoiceRepository, invoices_array
    invoice = invoices_array.find_by_id(4985)
    assert_instance_of Invoice, invoice
  end

  def test_merchants_can_call_all_items
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    merchants_array = sa.sales_engine.merchants
    merchant = merchants_array.find_by_id(12334165)
    items = merchant.items
    assert_instance_of Array, items
  end

  def test_merchants_can_call_all_invoices
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    merchants_array = sa.sales_engine.merchants
    merchant = merchants_array.find_by_id(12334165)
    invoices = merchant.invoices
    assert_instance_of Array, invoices
  end

  def test_merchants_items_can_be_averaged
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    x = sa.average_items_per_merchant
    assert_equal 2.88, x
  end

  def test_invoices_can_call_merchant_by_id
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    invoices_repo = sa.sales_engine.invoices
    invoice = invoices_repo.find_by_id(4985)
    merchant = invoice.merchant
    assert_instance_of Merchant, merchant
  end

  def test_it_takes_standard_deviation
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    result = sa.average_items_per_merchant_standard_deviation
    assert_equal 3.26, result
  end

  def test_it_lists_merchants_with_most_items
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    result = sa.merchants_with_high_item_count
    assert_instance_of Array, result
    assert_instance_of Merchant, result[0]
  end

  def test_it_gives_average_price_for_one_merchant
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    result = sa.average_item_price_per_merchant(12334165)
    assert_equal 100, result
  end

  def test_golden_items_return_array_with_items
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    result = sa.golden_items
    assert_instance_of Array, result
    assert_instance_of String, result[0]
  end

  def test_it_can_return_average_invoices
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    result = sa.average_invoices_per_merchant
    assert_instance_of Float, result
  end

  def test_it_calculates_invoice_standard_deviation
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    result = sa.average_invoices_per_merchant_standard_deviation
    assert_instance_of Float, result
  end

  def test_it_returns_top_invoiced_merchants
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    result = sa.top_merchants_by_invoice_count
    assert_instance_of Array, result
    assert_instance_of String, result[0]
  end

  def test_it_returns_array_of_bottom_invoiced_merchants
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    result = sa.bottom_merchants_by_invoice_count
    assert_instance_of Array, result
  end

  def test_status_percentages_all_work
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv"})
    sa = SalesAnalyst.new(se)
    result = sa.invoice_status(:pending)
    result2 = sa.invoice_status(:shipped)
    result3 = sa.invoice_status(:returned)
    assert_equal 29.55, result
    assert_equal 56.95, result2
    assert_equal 13.5, result3
  end

end
