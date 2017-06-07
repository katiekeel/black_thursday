require './test/test_helper'
require './lib/merchant'

class MerchantTest < Minitest::Test

  def test_it_initializes_with_hash
    merchant = Merchant.new({:id => 103383, :name => "Daniel"}, merchant_repo = nil)
    assert_instance_of Merchant, merchant
  end

  def test_merchant_has_id
    merchant = Merchant.new({:id => 103383, :name => "Daniel"}, merchant_repo = nil)
    assert_equal merchant.id, 103383
  end

  def test_merchant_has_name
    merchant = Merchant.new({:id => 103383, :name => "Daniel"}, merchant_repo = nil)
    assert_equal merchant.name, "Daniel"
  end

  def test_merchant_id_is_integer
    merchant = Merchant.new({:id => 103383, :name => "Daniel"}, merchant_repo = nil)
    assert_instance_of Integer, merchant.id
  end

  def test_merchant_name_is_string
    merchant = Merchant.new({:id => 103383, :name => "Daniel"}, merchant_repo = nil)
    assert_instance_of String, merchant.name
  end

  def test_merchant_carries_merchant_repo
    merchant = Merchant.new({:id => 103383, :name => "Daniel"}, merchant_repo = nil)
    assert_nil merchant.merchant_repo
  end


end
