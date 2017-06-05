require './test/test_helper'
require './lib/item'

class ItemTest < Minitest::Test

  def test_item_exists
    item = Item.new({:id => nil}, item_repo = nil)
    assert_instance_of Item, item
  end

  def test_item_has_an_id
    item = Item.new({:id => 13}, item_repo = nil)
    assert_equal item.id, 13
  end

  def test_item_has_a_name
    item = Item.new({:name => "scarf"}, item_repo = nil)
    assert_equal item.name, "scarf"
  end

  def test_item_has_a_description
    item = Item.new({:description => "blue and fuzzy"}, item_repo = nil)
    assert_equal item.description, "blue and fuzzy"
  end

  def test_item_has_a_price
    item = Item.new({:unit_price => "1099"}, item_repo = nil)
    assert_equal item.unit_price, 0.1099e2
  end

  def test_item_has_another_price
    item = Item.new({:unit_price => "15099"}, item_repo = nil)
    assert_equal item.unit_price, 0.15099e3
  end

  def test_item_price_length_is_three
    item = Item.new({:unit_price => "109"}, item_repo = nil)
    assert_equal item.unit_price, 0.109e1
  end

  def test_item_price_is_big_decimal
    item = Item.new({:unit_price => "109"}, item_repo = nil)
    assert_instance_of BigDecimal, item.unit_price
  end

  def test_item_price_to_dollars
    item = Item.new({:unit_price => "109"}, item_repo = nil)
    item_price = item.unit_price_to_dollars
    assert_equal item_price, 1.09
  end

  def test_item_price_in_dollars_is_a_float
    item = Item.new({:unit_price => "109"}, item_repo = nil)
    item_price = item.unit_price_to_dollars
    assert_instance_of Float, item_price
  end

  def test_item_has_a_merchant_id
    item = Item.new({:merchant_id => 145}, item_repo = nil)
    assert_equal item.merchant_id, 145
  end

  def test_item_has_a_create_date
    time = Time.now
    item = Item.new({:created_at => time}, item_repo = nil)
    assert_equal item.created_at, time
  end

  def test_item_has_an_update_date
    time = Time.now
    item = Item.new({:updated_at => time}, item_repo = nil)
    assert_equal item.updated_at, time
  end

  def test_item_price_in_dollars
    item = Item.new({:unit_price => "1099"}, item_repo = nil)
    assert_equal item.unit_price_to_dollars, 10.99
  end

  def test_item_price_in_dollars_three
    item = Item.new({:unit_price => "109"}, item_repo = nil)
    assert_equal item.unit_price_to_dollars, 1.09
  end

  def test_item_price_in_dollars_five
    item = Item.new({:unit_price => "10990"}, item_repo = nil)
    assert_equal item.unit_price_to_dollars, 109.90
  end

end
