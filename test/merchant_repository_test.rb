require './test/test_helper'
require './lib/merchant_repository'

class MerchantRepoTest < Minitest::Test

  def test_it_exists
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    assert_instance_of MerchantRepository, merchant
  end

  def test_it_initiates_with_hash
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.collection
    assert_instance_of Array, result
  end

  def test_it_can_populate_array_with_all_475_merchants
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.collection
    assert_instance_of Array, result
    result2 = merchant.collection
    assert_equal 475, result2.length
  end

  def test_find_by_name
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_by_name("Shopin1901")
    assert_equal "Shopin1901", result.name
  end

  def test_find_by_name_with_nil
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_by_name("asjkhdakjhdjakhdwa")
    assert_nil result
  end

  def test_merchants_carry_id
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_by_id(12334105)
    assert_instance_of Merchant, result
  end

  def test_find_bys_return_nil_if_no_match
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_by_name("Daniel")
    result2 = merchant.find_by_id("1233410115")
    assert_nil result
    assert_nil result
  end

  def test_it_can_match_with_improper_case
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_by_name("shopin1901")
    assert_equal "Shopin1901", result.name
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

  def test_find_all_by_name_with_justmstyle
    merchant = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
    result = merchant.find_all_by_name("justMstyle")
    assert_equal result.first.name, "justMstyle"
  end
end
