require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def test_it_exists
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items
    merchants = se.merchants
    assert_instance_of ItemRepository, items
    assert_instance_of MerchantRepository, merchants
  end

  def test_items_can_searched_via_find_by_id
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items
    assert_instance_of Item, items.find_by_id(263395237)
  end

  def test_items_can_searched_via_find_by_name
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items
    assert_instance_of Item, items.find_by_name("510+ RealPush Icon Set")
  end

  def test_items_can_searched_via_find_all_by_price
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items
    assert_equal 7, items.find_all_by_price(400.00).count
  end

  def test_items_can_searched_via_find_by_merchant_id
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items
    assert_equal 1, items.find_all_by_merchant_id("12334141").count
  end

  def test_it_returns_empty_array_with_invalid_merchant_id
    skip
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items
    assert_equal items.find_all_by_merchant_id("kwjalkdwja"), []
  end

  def test_merchants_all
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    merchants = se.merchants
    assert_instance_of Array, merchants.all
  end

  def test_merchants_find_by_name
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    merchants = se.merchants
    result = merchants.find_by_name("Shopin1901")
    assert_equal "shopin1901", result.name
  end

  def test_merchants_find_by_name_with_nil
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    merchants = se.merchants
    result = merchants.find_by_name("asdkjhaiufhenjka")
    assert_nil result
  end

  def test_merchants_find_by_id
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    merchants = se.merchants
    result = merchants.find_by_id("12334105")
    assert_instance_of Merchant, result
  end

  def test_merchants_find_by_id_with_nil
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    merchants = se.merchants
    result = merchants.find_by_id("1233410115")
    assert_nil result
  end

  def test_merchants_find_all_by_name
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    merchants = se.merchants
    result = merchants.find_all_by_name("Shop")
    assert_equal result.count, 26
  end

  def test_items_all
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items
    assert_instance_of Array, items.all
  end


  def test_items_find_all_with_description
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items
    result = items.find_all_with_description("green")
    assert_equal result.count, 38
  end

  def test_items_find_all_by_price_in_range
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv"})
    items = se.items
    result = items.find_all_by_price_in_range(10..20)
    assert_equal result.count, 317
  end


end
