require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'

class MerchantRepoTest < Minitest::Test

  def test_it_exists
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    assert_instance_of MerchantRepository, merchant
  end

  def test_it_initiates_with_hash
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.merchants
    assert_instance_of Hash, result
  end

  def test_it_can_populate_array_with_all_475_merchants
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.merchants
    assert_instance_of Hash, result
    result2 = merchant.merchants
    assert_equal 475, result2.length
  end

  def test_merchants_attr_reader_has_fixnums_as_keys
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    merchant_list = merchant.merchants
    merchant_1 = merchant_list.keys
    assert_instance_of Fixnum, merchant_1[0]
  end

  def test_find_by_name
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_by_name("shopin1901")
    assert_equal "shopin1901", result.name
  end

  def test_merchants_carry_id
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_by_id("12334105")
    assert_instance_of Merchant, result
  end

  def test_find_bys_return_nil_if_no_match
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_by_name("Daniel", sales_engine = nil)
    result2 = merchant.find_by_id("1233410115")
    puts result
    puts result2
  end

  def test_it_can_match_with_improper_case
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_by_name("Shopin1901", sales_engine = nil)
    assert_equal "shopin1901", result.name
  end

  def test_it_can_return_multiple_name_matches
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_all_by_name('th')
    assert_instance_of Array, result
    assert_equal 40, result.length
  end

  def test_it_can_use_all_method
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    all_merchants = merchant.all
    assert_equal 475, all_merchants.length
  end
end
