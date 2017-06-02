require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/csv_opener'

class CSVOpenerTest < Minitest::Test
  def test_it_exists_and_requires_three_arguments
    skip
    cs = CSVOpener.new("./data/merchants.csv", "repo", "merchant")
    assert_instance_of CSVOpener, cs
  end

  def test_it_can_return_merch_repo_for_merchant_entry
    cs = CSVOpener.new("./data/merchants.csv", repo = nil, "merchant")
    result = cs.holder
    assert_instance_of Array, result
    assert_instance_of Merchant, result.first
    result2 = result.first
    assert_equal "shopin1901", result2.name
  end

  def test_it_can_return_merch_repo_for_item_entry
    cs = CSVOpener.new("./data/items.csv", repo = nil, "item")
    result = cs.holder
    assert_instance_of Array, result
    assert_instance_of Item, result.first
    assert_equal 1200.0, result.first.unit_price.to_f
  end

  def test_it_can_return_merch_repo_for_invoice_entry
    cs = CSVOpener.new("./data/invoices.csv", repo = nil, "invoice")
    result = cs.holder
    assert_instance_of Array, result
    assert_instance_of Invoice, result.first
    assert_equal 1, result.first.customer_id
    assert_equal 12335938, result.first.merchant_id
  end
end
