require './test/test_helper'
require './lib/invoice_item'

class InvoiceItemTest < Minitest::Test

  def test_invoice_item_exists
    invoice_item = InvoiceItem.new({:id => 1}, invoice_item_repo = nil)
    assert_instance_of InvoiceItem, invoice_item
  end

  def test_invoice_item_id
    invoice_item = InvoiceItem.new({:id => 1}, invoice_item_repo = nil)
    assert_equal invoice_item.id, 1
  end

  def test_invoice_item_id_is_integer
    invoice_item = InvoiceItem.new({:id => 1}, invoice_item_repo = nil)
    assert_instance_of Integer, invoice_item.id
  end

  def test_invoice_item_item_id
    invoice_item = InvoiceItem.new({:item_id => 1}, invoice_item_repo = nil)
    assert_equal invoice_item.item_id, 1
  end

  def  test_invoice_item_item_id_is_integer
    invoice_item = InvoiceItem.new({:item_id => 1}, invoice_item_repo = nil)
    assert_instance_of Integer, invoice_item.item_id
  end

  def test_invoice_item_invoice_id
    invoice_item = InvoiceItem.new({:invoice_id => 1}, invoice_item_repo = nil)
    assert_equal invoice_item.invoice_id, 1
  end

  def test_invoice_item_invoice_id_is_integer
    invoice_item = InvoiceItem.new({:invoice_id => 1}, invoice_item_repo = nil)
    assert_instance_of Integer, invoice_item.invoice_id
  end

  def test_invoice_item_quantity
    invoice_item = InvoiceItem.new({:quantity => 1}, invoice_item_repo = nil)
    assert_equal invoice_item.quantity, 1
  end

  def test_invoice_item_quantity_is_integer
    invoice_item = InvoiceItem.new({:quantity => 1}, invoice_item_repo = nil)
    assert_instance_of Integer, invoice_item.quantity
  end

  def test_invoice_item_unit_price
    invoice_item = InvoiceItem.new({:unit_price => 1}, invoice_item_repo = nil)
    assert_equal invoice_item.unit_price, 0.1e-1
  end

  def test_invoice_item_unit_price_is_big_decimal
    invoice_item = InvoiceItem.new({:unit_price => 1299}, invoice_item_repo = nil)
    assert_instance_of BigDecimal, invoice_item.unit_price
  end

  def test_invoice_item_unit_price_to_dollars
    invoice_item = InvoiceItem.new({:unit_price => 1299}, invoice_item_repo = nil)
    assert_equal invoice_item.unit_price_to_dollars, 12.99
  end

  def test_invoice_item_unit_price_to_dollars_is_float
    invoice_item = InvoiceItem.new({:unit_price => 1299}, invoice_item_repo = nil)
    assert_instance_of Float, invoice_item.unit_price_to_dollars
  end

  def test_invoice_item_created_at
    time = Time.now
    invoice_item = InvoiceItem.new({:created_at => time}, invoice_item_repo = nil)
    assert_equal invoice_item.created_at, time
  end

  def test_invoice_item_created_at_is_time
    time = Time.now
    invoice_item = InvoiceItem.new({:created_at => time}, invoice_item_repo = nil)
    assert_instance_of Time, invoice_item.created_at
  end

  def test_invoice_item_updated_at
    time = Time.now
    invoice_item = InvoiceItem.new({:updated_at => time}, invoice_item_repo = nil)
    assert_equal invoice_item.updated_at, time
  end

  def test_invoice_item_unit_price_to_dollars
    invoice_item = InvoiceItem.new({:unit_price => 199}, invoice_item_repo = nil)
    assert_equal invoice_item.unit_price_to_dollars, 1.99
  end

  def test_invoice_item_updated_at_is_time
    time = Time.now
    invoice_item = InvoiceItem.new({:updated_at => time}, invoice_item_repo = nil)
    assert_instance_of Time, invoice_item.updated_at
  end
end
